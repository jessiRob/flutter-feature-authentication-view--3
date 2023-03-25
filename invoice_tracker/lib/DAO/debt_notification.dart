import 'package:cloud_firestore/cloud_firestore.dart';

class DebtNotificationsDAO {

  final String uid;
  DebtNotificationsDAO({ required this.uid });

  final CollectionReference debtNotificationCollection = FirebaseFirestore.instance.collection('debt_notification');
  Future updateDebtNotificationData(String? idUser, String name, String value, DateTime date,) async {
     try {
      
      debtNotificationCollection.doc(uid).set(
        {
        'id_user': idUser,
        'name': name,
        'value': value,
        'date': date,
        }
      );
      print('funciona');
      return await debtNotificationCollection.doc(uid).get();
      } on Exception catch (e) {
        print('erroooooor');
        return await debtNotificationCollection.doc(uid).get();
      }
    
  }
}