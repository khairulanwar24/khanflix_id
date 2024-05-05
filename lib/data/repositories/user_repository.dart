// berisi kontrak yg terkait dgn user\
import 'dart:io';

import 'package:khanflix_id/domain/entities/result.dart';
import 'package:khanflix_id/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });
  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required String user});
  Future<Result<User>> getUserBalance({required String uid});
  Future<Result<User>> updateUserBalance(
      {required String uid, required int balance});
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File imageFile});
}
