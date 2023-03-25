import 'package:invoice_tracker/dataSources/tips_data.dart';

class TipsModel {
  TipsData _tips;

  TipsModel(this._tips);

}

List<Tip> organizeLikedOnes(TipsModel model){
  TipsData tips = model._tips;
  return tips.sort();
}