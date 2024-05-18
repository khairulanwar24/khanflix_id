// tidak perlu memberikan paramter apapun, tidka mengharapkan kembalian apapun, yg penting berhasil atau tidak nya proses logout tsb. Maka dr itu nilai kembalian usecase logout adalah result voud
import 'package:khanflix_id/data/repositories/authentication.dart';

import 'package:khanflix_id/domain/usecases/usecase.dart';

class Logout implements UseCase {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future call(params) {
    return _authentication.logout();
  }
}
