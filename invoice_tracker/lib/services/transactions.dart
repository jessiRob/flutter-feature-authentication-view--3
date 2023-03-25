import 'package:invoice_tracker/services/database.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
class TransactionService {
  Future registerNewMovement (String? idUser,String name, String category, String value, DateTime date, String paymentmethod) async {

    try{
      
      await DatabaseService (uid: uuid.v4()).updateTransactionData(idUser, name, category, value, date, paymentmethod);
      return 'yes';
    } catch(e){
      return null;
    }
  }

}