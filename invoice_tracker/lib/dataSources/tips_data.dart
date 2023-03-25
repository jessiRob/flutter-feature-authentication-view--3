TipsData createTipsData(){
  List<Tip> tipsList = [];

  //Create Tips
  Tip tip1 = Tip("1",1,"Quit bad habits. No, it's certainly not easy to quit, but for example, if you smoke a pack and a half every day, that amounts to nearly 3,000 a year you can realize in savings if you quit.");
  Tip tip2 = Tip("2",3,"Try to not inset too much on vacations, you can have fun without wasting money. Instead of dropping several thousand on airline tickets overseas, look in your own backyard for fun vacations close to home. ");
  Tip tip3 = Tip("3",2,"If you're trying to save money through budgeting but still carrying a large debt burden, start with the debt. Once you're free from paying interest on your debt, that money can easily be put into savings.");
  Tip tip4 = Tip("4",5,"Lowering the thermostat on your water heater by 10°F can save you between 3-5 percent in energy costs.");
  Tip tip5 = Tip("5",3,"One of the best ways to save money is by visualizing what you are saving for. If you need motivation, set saving targets along with a timeline to make it easier to save.");
  Tip tip6 = Tip("6",5,"Installing an on-demand or tankless water heater can deliver up to 30 percent savings compared with a standard storage tank water heater.");
  Tip tip7 = Tip("7",2,"Set up an auto debit from your checking account to your savings account each payday. Whether it's 50 every two weeks or 500, don't cheat yourself out of a healthy long-term savings plan.");

  //Add tips
  tipsList.add(tip1);
  tipsList.add(tip2);
  tipsList.add(tip3);
  tipsList.add(tip4);
  tipsList.add(tip5);
  tipsList.add(tip6);
  tipsList.add(tip7);


  TipsData tips = TipsData(tipsList);

  return tips;
}

class TipsData {
  List<Tip> _tips = [];

  TipsData(this._tips);

  List<Tip> get tips => _tips;

  void addTip(Tip tip){
    _tips.add(tip);
  }

  List<Tip> sort(){
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

