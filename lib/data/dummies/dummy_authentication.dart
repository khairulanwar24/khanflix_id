import 'package:khanflix_id/data/repositories/authentication.dart';
import 'package:khanflix_id/domain/entities/result.dart';

class DummyAuthentication implements Authentication {
  @override
  String? getLoggedInUserId() {
    // TODO: implement getLoggedInUserId
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> login(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    // return const Result.success('ID-12345');
    return const Result.failed('GAGALLLL');
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> register(
      {required String email, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
