import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invoice_tracker/DAO/debt_notification.dart';
import 'package:invoice_tracker/DAO/saving_notification.dart';
import 'package:invoice_tracker/DAO/transactions.dart';

import '../model/transactionModel.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ required this.uid });
  //Colection reference
  Future registerNewMovement (String? idUser,String name, String category, String value, DateTime date, String paymentmethod) async {

    try{
      await TransactionsDAO (uid: uid).updateTransactionData(idUser, name, category, value, date, paymentmethod);
      return 'yes';
    } catch(e){
      return null;
    }
  }

  Future getLastUserMovements (String? idUser) async {
    List<TransactionModel> transactionList = [];
    if (idUser != null)
      {
      try {
        final docs = await TransactionsDAO (uid: uid).getLastUserMovements(idUser);
        for (var document in docs) {
          transactionList.add(TransactionModel(
            idUser: document['id_user'],
            name: document['name'],
            category: document['category'],
            value: double.parse(document['value']),
            date: document['date'].toDate(),
            paymentMethod: document['paymentmethod'],
          ));
        }
        return transactionList;
      } catch (e) {
        print('Error getting last user movements: $e');
        rethrow;
      }}
    else {
      return transactionList;
    }
    
  }

  Future getAllUserMovements (String? idUser) async {
     List<TransactionModel> transactionList = [];
    if (idUser != null)
      {
      try {
        final docs = await TransactionsDAO (uid: uid).getAllUserTransactions(idUser);
        for (var document in docs) {
          transactionList.add(TransactionModel(
            idUser: document['id_user'],
            name: document['name'],
            category: document['category'],
            value: double.parse(document['value']),
            date: document['date'].toDate(),
            paymentMethod: document['paymentmethod'],
          ));
        }
        return transactionList;
      } catch (e) {
        print('Error getting last user movements: $e');
        rethrow;
      }}
    else {
      return transactionList;
    }
  }
  Future getAllUsersMovements () async {
     List<TransactionModel> transactionList = [];
      try {
        final docs = await TransactionsDAO (uid: uid).getAllUsersTransactions();
        for (var document in docs) {
          transactionList.add(TransactionModel(
            idUser: document['id_user'],
            name: document['name'],
            category: document['category'],
            value: double.parse(document['value']),
            date: document['date'].toDate(),
            paymentMethod: document['paymentmethod'],
          ));
        }
        return transactionList;
      } catch (e) {
        print('Error getting last user movements: $e');
        rethrow;
      }
  }

  Future getAllLastMonthTransactions () async {
     List<TransactionModel> transactionList = [];
      try {
        final docs = await TransactionsDAO (uid: uid).getAllLastMonthTransactions();
        for (var document in docs) {
          transactionList.add(TransactionModel(
            idUser: document['id_user'],
            name: document['name'],
            category: document['category'],
            value: double.parse(document['value']),
            date: document['date'].toDate(),
            paymentMethod: document['paymentmethod'],
          ));
        }
        return transactionList;
      } catch (e) {
        print('Error getting last user movements: $e');
        rethrow;
      }
  }

  Future getLastMonthTransactions (String? idUser) async {
     List<TransactionModel> transactionList = [];
    if (idUser != null)
      {
      try {
        final docs = await TransactionsDAO (uid: uid).getLastMonthTransactions(idUser);
        for (var document in docs) {
          transactionList.add(TransactionModel(
            idUser: document['id_user'],
            name: document['name'],
            category: document['category'],
            value: double.parse(document['value']),
            date: document['date'].toDate(),
            paymentMethod: document['paymentmethod'],
          ));
        }
        return transactionList;
      } catch (e) {
        print('Error getting last user movements: $e');
        rethrow;
      }}
    else {
      return transactionList;
    }
  }

  Future<double> getBudget(String? idUser) async {
    double budget = 0;
    try {
      if (idUser != null) {
      final docs = await TransactionsDAO (uid: uid).getAllUserTransactions(idUser);
      for (var document in docs) {
          budget += double.parse(document['value']);
      }
    }
    }
    catch(e) {
      budget = 0; 
    }
    return budget;
  }

  Future registerDebtNotification (String? idUser,String name, String value, DateTime date) async {

    try{
      await DebtNotificationsDAO (uid: uid).updateDebtNotificationData(idUser, name, value, date);
      return 'yes';
    } catch(e){
      return null;
    }
  }
  Future registerSavingNotification (String? idUser,String maxValue, String referenceValue) async {

    try{
      await SavingNotificationsDAO (uid: uid).updateSavingNotificationData(idUser, maxValue, referenceValue);
      return 'yes';
    } catch(e){
      return null;
    }
  }
  
}