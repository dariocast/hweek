import 'package:hweek/domain/domain.dart';

class FetchPathSegments {
  FetchPathSegments(this.repository);
  final PathRepository repository;

  Future<List<PathSegment>> call() async {
    return repository.fetchPathSegments();
  }
}
