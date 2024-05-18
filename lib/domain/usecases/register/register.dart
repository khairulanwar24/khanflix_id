import 'package:khanflix_id/data/repositories/authentication.dart';
import 'package:khanflix_id/data/repositories/user_repository.dart';
import 'package:khanflix_id/domain/entities/result.dart';
import 'package:khanflix_id/domain/entities/user.dart';
import 'package:khanflix_id/domain/usecases/register/register_param.dart';
import 'package:khanflix_id/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParam> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParam params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
