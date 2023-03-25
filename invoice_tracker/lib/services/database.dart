import 'package:invoice_tracker/DAO/debt_notification.dart';
import 'package:invoice_tracker/DAO/saving_notification.dart';
import 'package:invoice_tracker/DAO/transactions.dart';

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