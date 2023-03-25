import 'package:cloud_firestore/cloud_firestore.dart';

class SavingNotificationsDAO {

  final String uid;
  SavingNotificationsDAO({ required this.uid });

  final CollectionReference savingNotificationCollection = FirebaseFirestore.instance.collection('saving_notification');
  Future updateSavingNotificationData(String? idUser, String maxValue, String referenceValue,) async {
     try {
      
      savingNotificationCollection.doc(uid).set(
        {
        'id_user': idUser,
        'maxValue': maxValue,
        'referenceValue': referenceValue,
        }
      );
      print('funciona');
      return await savingNotificationCollection.doc(uid).get();
      } on Exception catch (e) {
        print('erroooooor');
        return await savingNotificationCollection.doc(uid).get();
      }
    
  }
}