import 'package:invoice_tracker/dataSources/tips_data.dart';
import 'package:invoice_tracker/model/tips_model.dart';


class TipsRepo {
  late TipsData tips = createTipsData();
  late TipsModel model;

  TipsRepo(){
    this.model = TipsModel(tips);
  }

  List<Tip> sortedTips(){
    return organizeLikedOnes(this.model);
  }

}