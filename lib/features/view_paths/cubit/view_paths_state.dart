part of 'view_paths_cubit.dart';

@immutable
sealed class ViewPathsState {}

final class ViewPathsInitial extends ViewPathsState {}

final class ViewPathsLoading extends ViewPathsState {}

class ViewPathsLoaded extends ViewPathsState {
  ViewPathsLoaded(this.paths);
  final List<PathSegment> paths;
}

class ViewPathsError extends ViewPathsState {
  ViewPathsError(this.message);
  final String message;
}
