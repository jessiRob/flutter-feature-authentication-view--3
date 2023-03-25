
class TipsModel {
  List<Tip> _tips;

  TipsModel(this._tips);

  List<Tip> sortTips(){
    _tips.sort((a, b) => a._likes.compareTo(b._likes));
    return _tips;
  }

}

class Tip {
  String _id;
  int _likes;
  String _tip;

  Tip(this._id, this._likes, this._tip);

  String get id => _id;

  String get tip => _tip;

  int get likes => _likes;
}