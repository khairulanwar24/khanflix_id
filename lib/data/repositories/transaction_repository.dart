import 'package:khanflix_id/domain/entities/result.dart';
import 'package:khanflix_id/domain/entities/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction});
  Future<Result<Transaction>> getUserTransaction({required String uid});
}
