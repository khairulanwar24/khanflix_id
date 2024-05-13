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
      {required Transaction transaction}) async{
    firestore.CollectionReference<Map<String, dynamic>> transaction =
        _firebaseFirestore.collection('transactions');

    try {
      var balanceResult =
          await FirebaseUserRepository().getUserBalance(uid: transaction.uid);
    }
  }

  @override
  Future<Result<Transaction>> getUserTransaction({required String uid}) {
    // TODO: implement getUserTransaction
    throw UnimplementedError();
  }
}
