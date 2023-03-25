import 'package:invoice_tracker/model/tips_model.dart';
import 'package:invoice_tracker/repository/repository.dart';
import '../dataSources/tips_data.dart';

class Controller{
  TipsRepo tipsRepo = TipsRepo();

  Controller();

  List<Tip> getTips(){
    return tipsRepo.sortedTips();
  }

}