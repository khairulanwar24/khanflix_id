import 'package:dio/dio.dart';
import 'package:khanflix_id/data/repositories/movie_repository.dart';
import 'package:khanflix_id/domain/entities/actor.dart';
import 'package:khanflix_id/domain/entities/movie.dart';
import 'package:khanflix_id/domain/entities/movie_detail.dart';
import 'package:khanflix_id/domain/entities/result.dart';

class TmdbMovieRepository implements MovieRepository {
  final Dio? _dio;
  final _accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZGRiY2EyM2JlM2Y0NDU4NGI5NDcwOWEzNWNhYmM1ZSIsInN1YiI6IjYzMmM2YjY0NGI2ZDlkMDA3ZTU5NGMwNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.w4MW6KOihz5_RNuh5f4UWCdTjRD-4mF3_5bPLHhx4gE';

  late final Options _options = Options(headers: {
    'Authorization': 'Bearer $_accessToken',
    'accept': 'application/json',
  });

  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();
  @override
  Future<Result<List<Actor>>> getActor({required int id}) {
    // TODO: implement getActor
    throw UnimplementedError();
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) {
    // TODO: implement getDetail
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) {
    // TODO: implement getNowPlaying
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    throw UnimplementedError();
  }
}

enum _MovieCategory {
  nowPlaying('now-playing'),
  upcoming('upcoming');

  final String _instring;

  const _MovieCategory(String instring) : _inString = inString;

  @override
  String toString() => _inString;
}
