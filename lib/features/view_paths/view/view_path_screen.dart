import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:hweek/domain/domain.dart';
import 'package:hweek/features/view_paths/cubit/view_paths_cubit.dart';
import 'package:hweek/l10n/l10n.dart';

class ViewPathsScreen extends StatefulWidget {
  const ViewPathsScreen({super.key});

  @override
  State<ViewPathsScreen> createState() => _ViewPathsScreenState();
}

class _ViewPathsScreenState extends State<ViewPathsScreen> {
  late MapController _mapController;
  final Map<int, Color> _segmentColors = {};
  final List<GeoPoint> _markers = [];

  void _refreshData() {
    context.read<ViewPathsCubit>().loadPaths();
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initMapWithUserPosition: const UserTrackingOption(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paths Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
        ],
      ),
      body: BlocBuilder<ViewPathsCubit, ViewPathsState>(
        builder: (context, state) {
          if (state is ViewPathsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ViewPathsError) {
            return Center(child: Text(state.message));
          } else if (state is ViewPathsLoaded) {
            return OSMFlutter(
              controller: _mapController,
              osmOption: OSMOption(
                zoomOption: const ZoomOption(
                  initZoom: 14,
                  minZoomLevel: 8,
                  maxZoomLevel: 18,
                ),
                userLocationMarker: UserLocationMaker(
                  personMarker: const MarkerIcon(
                    icon: Icon(
                      Icons.person_pin_circle,
                      color: Colors.blue,
                      size: 48,
                    ),
                  ),
                  directionArrowMarker: const MarkerIcon(
                    icon: Icon(Icons.navigation, color: Colors.blue, size: 32),
                  ),
                ),
                showContributorBadgeForOSM: true,
              ),
              onMapIsReady: (ready) async {
                await _loadMarkers(state.paths);
              },
            );
          }
          return Center(child: Text(localizations.viewPaths_emptyPaths));
        },
      ),
    );
  }

  Future<void> _loadMarkers(List<PathSegment> paths) async {
    // Remove old markers
    for (final marker in _markers) {
      await _mapController.removeMarker(marker);
    }
    _markers.clear();

    final random = Random();

    for (var i = 0; i < paths.length; i++) {
      final path = paths[i];
      final color = _segmentColors.putIfAbsent(
        i,
        () => Colors.primaries[random.nextInt(Colors.primaries.length)],
      );

      final headPoint = GeoPoint(
        latitude: path.head.latitude,
        longitude: path.head.longitude,
      );
      final tailPoint = GeoPoint(
        latitude: path.tail.latitude,
        longitude: path.tail.longitude,
      );

      // Add markers
      await _mapController.addMarker(
        headPoint,
        markerIcon: MarkerIcon(
          icon: Icon(Icons.play_arrow, color: color, size: 32),
        ),
      );
      await _mapController.addMarker(
        tailPoint,
        markerIcon: MarkerIcon(
          icon: Icon(Icons.stop, color: color, size: 32),
        ),
      );
      _markers.addAll([headPoint, tailPoint]);

      // Draw path (highlight) between head and tail
      await _mapController.drawRoad(
        headPoint,
        tailPoint,
        roadOption: RoadOption(
          roadColor: color,
          roadWidth: 8,
          zoomInto: false,
        ),
      );
    }

    if (_markers.isNotEmpty) {
      final boundingBox = BoundingBox.fromGeoPoints(_markers);
      await _mapController.zoomToBoundingBox(boundingBox, paddinInPixel: 50);
    }
  }
}
