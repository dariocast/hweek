import 'package:bloc/bloc.dart';
import 'package:hweek/domain/domain.dart';
import 'package:hweek/features/view_paths/usecases/fetch_path_segments.dart';
import 'package:meta/meta.dart';

part 'view_paths_state.dart';

class ViewPathsCubit extends Cubit<ViewPathsState> {
  ViewPathsCubit(this.fetchPathSegments) : super(ViewPathsInitial());
  final FetchPathSegments fetchPathSegments;

  Future<void> loadPaths() async {
    emit(ViewPathsLoading());
    try {
      final paths = await fetchPathSegments();
      emit(ViewPathsLoaded(paths));
    } catch (e) {
      emit(ViewPathsError('Failed to load paths'));
    }
  }
}
