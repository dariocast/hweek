import 'package:hweek/data/datasources/datasources.dart';
import 'package:hweek/domain/domain.dart';

class PathRepositoryImpl implements PathRepository {
  PathRepositoryImpl(this.remoteDataSource);
  final RemotePathDataSource remoteDataSource;

  @override
  Future<List<PathSegment>> fetchPathSegments() async {
    return remoteDataSource.getPathSegments();
  }
}
