import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class DatabaseService {
  final String uid;
  DatabaseService({ required this.uid });
  //Colection reference

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
      print('funciona');
      return await transactionCollection.doc(uid).get();
      } on Exception catch (e) {
        print('erroooooor');
        return await transactionCollection.doc(uid).get();
      }
    
  }
}