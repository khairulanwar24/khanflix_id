import 'package:khanflix_id/data/firebase/firebase_user_repository.dart';
import 'package:khanflix_id/data/repositories/transaction_repository.dart';
import 'package:khanflix_id/domain/entities/result.dart';
import 'package:khanflix_id/domain/entities/transaction.dart';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseTransactionRepository implements TransactionRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransactionRepository(
      {firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;
  @override
  Future<Result<Transaction>> createTransaction(
      {required Transaction transaction}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('transactions');

    try {
      var balanceResult =
          await FirebaseUserRepository().getUserBalance(uid: transaction.uid);

      if (balanceResult.isSuccess) {
        int previousBalance = balanceResult.resultValue!;

        if (previousBalance - transaction.total >= 0) {
          await transactions.doc(transaction.id).set(transaction.toJson());

          var result = await transactions.doc(transaction.id).get();

          if (result.exists) {
            await FirebaseUserRepository().updateUserBalance(
                uid: transaction.uid,
                balance: previousBalance - transaction.total);

            return Result.success(Transaction.fromJson(result.data()!));
          } else {
            return const Result.failed('Failed to create transaction data');
          }
        } else {
          return const Result.failed('Insufficient balance');
        }
      } else {
        return const Result.failed('Failed to create transaction data');
      }
    } catch (e) {
      return const Result.failed('Failed to create transaction data');
    }
  }

  @override
  Future<Result<Transaction>> getUserTransaction({required String uid}) {
    // TODO: implement getUserTransaction
    throw UnimplementedError();
  }
}
