import 'package:invoice_tracker/model/tips_model.dart';
import 'package:invoice_tracker/repository/repository.dart';

class Controller{
  TipsRepo tipsRepo = TipsRepo();

  Controller();

  Future<List<Tip>> getTips() async{
    await tipsRepo.setSavingTips();
    return tipsRepo.sortedTips();
  }

}