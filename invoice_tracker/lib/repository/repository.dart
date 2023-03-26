import 'package:invoice_tracker/DAO/saving_tips.dart';
import 'package:invoice_tracker/model/tips_model.dart';


class TipsRepo {
  late SavingTipsDAO dao = SavingTipsDAO();
  late List<Tip> tips;
  late TipsModel model;

  TipsRepo();


  List<Tip> sortedTips(){
    return this.model.sortTips();
  }

  Future setSavingTips() async{
    this.tips = await dao.getSavingTips();
    this.model = TipsModel(tips);
  }


}