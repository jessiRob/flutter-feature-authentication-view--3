import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invoice_tracker/model/tips_model.dart';


class SavingTipsDAO {

  final CollectionReference savingTipsCollection = FirebaseFirestore.instance.collection('saving_tips');
  late final stream = savingTipsCollection.snapshots();


  SavingTipsDAO();


  Future<List<Tip>> getSavingTips() async {
    final snapshot_saving_tips = await savingTipsCollection.get();
    final savingTips = snapshot_saving_tips.docs.map((e) => Tip(e.id,e["likes"],e["tip"])).toList();
    return savingTips;
  }
}