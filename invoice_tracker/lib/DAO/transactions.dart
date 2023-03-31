import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionsDAO {

  final String uid;
  TransactionsDAO({ required this.uid });

  final CollectionReference transactionCollection = FirebaseFirestore.instance.collection('transactions');
  Future updateTransactionData(String? idUser, String name, String category, String value, DateTime date, String paymentmethod) async {
     try {
      
      transactionCollection.doc(uid).set(
        {
        'id_user': idUser,
        'name': name,
        'category': category,
        'value': value,
        'date': date,
        'paymentmethod': paymentmethod,
        }
      );
      return await transactionCollection.doc(uid).get();
      } on Exception catch (e) {
        return await transactionCollection.doc(uid).get();
      }
    
  }

  Future<List<DocumentSnapshot>> getAllUserTransactions(String idUser) async {
    try {
      QuerySnapshot snapshot =
          await transactionCollection.where('id_user', isEqualTo: idUser).orderBy('date', descending: true).get();
      return snapshot.docs;
    } catch (e) {
      return [];
    }
  }
  Future<List<DocumentSnapshot>> getAllUsersTransactions() async {
    try {
      QuerySnapshot snapshot =
          await transactionCollection.orderBy('date', descending: true).get();
      return snapshot.docs;
    } catch (e) {
      return [];
    }
  }

  Future<List<DocumentSnapshot>> getAllLastMonthTransactions() async {
    try {
        final now = DateTime.now();
        DateTime dateOneMonthAgo;
        if (now.month > 1) {
          dateOneMonthAgo = DateTime(now.year, now.month -1, now.day);
        } else {
          dateOneMonthAgo = DateTime(now.year - 1, 1, 28);
        }

        QuerySnapshot snapshot =
          await transactionCollection
          .where('date', isGreaterThanOrEqualTo: dateOneMonthAgo)
          .get();

        return snapshot.docs;
      }
      catch(e) {
        print("Error en la lectura de los pedidos del último mes:" + e.toString());
        return [];
      }
  }

  Future<List<DocumentSnapshot>> getLastMonthTransactions(String idUser) async {
    try {
        final now = DateTime.now();
        DateTime dateOneMonthAgo;
        if (now.month > 1) {
          dateOneMonthAgo = DateTime(now.year, now.month -1, now.day);
        } else {
          dateOneMonthAgo = DateTime(now.year - 1, 1, 28);
        }

        QuerySnapshot snapshot =
          await transactionCollection
          .where('id_user', isEqualTo: idUser)
          .where('date', isGreaterThanOrEqualTo: dateOneMonthAgo)
          .get();

        return snapshot.docs;
      }
      catch(e) {
        print("Error en la lectura de los pedidos del último mes:" + e.toString());
        return [];
      }
  }

  Future<List<DocumentSnapshot>> getLastUserMovements(String idUser) async {
    try {
      final querySnapshot = await transactionCollection
          .where('id_user', isEqualTo: idUser)
          .orderBy('date', descending: true)
          .limit(5)
          .get();
      return querySnapshot.docs;
    } on Exception catch (e) {
      print('Error retrieving last user movements: $e');
      rethrow;
    }
  }



}