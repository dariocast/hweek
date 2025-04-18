import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:hweek/data/data.dart';
import 'package:hweek/features/view_paths/cubit/view_paths_cubit.dart';
import 'package:hweek/features/view_paths/usecases/fetch_path_segments.dart';
import 'package:hweek/features/view_paths/view/view_path_screen.dart';

class ViewPathsPage extends StatelessWidget {
  const ViewPathsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ViewPathsCubit(
        FetchPathSegments(
          PathRepositoryImpl(
            RemotePathDataSourceImpl(http.Client()),
          ),
        ),
      )..loadPaths(),
      child: const ViewPathsScreen(),
    );
  }
}
