import 'dart:async';

import 'package:clock_UI/Services/time.dart';
import 'package:clock_UI/screens/pop_up.dart';
import 'package:flutter/cupertino.dart';

import 'card_model.dart';
class CardData extends ChangeNotifier{

  String time;
  void getData()async{

    Timer.periodic(Duration(seconds: 1), (timer) async {
      TimeModel timer = TimeModel();
      var timeData1;
      time  = "??:??";
      timeData1 = await timer.getCityTime(PopUp.timezone);
      time = timeData1['time'];
      card.last = Card(
            country: card.last.timezone,
            timezone: card.last.timezone,
            iconSrc: 'assets/icons/Liberty.svg',
            time: time,
            period: 'PM',
          );
    });
    notifyListeners();
  }
  List<Card> card = [
    Card(
      country: 'New York, USA',
      timezone: '+3 HRS | EST',
      iconSrc: 'assets/icons/Liberty.svg',
      time: '9:20',
      period: 'PM',
    ),
    Card(
      country: 'New York, USA',
      timezone: '+3 HRS | EST',
      iconSrc: 'assets/icons/Liberty.svg',
      time: '9:20',
      period: 'PM',
    )
  ];

  // UnmodifiableListView<Card> get card {
  //   return UnmodifiableListView(_card);
  // }

  int get cardCount {
    return card.length;
  }

  void addCard(String timezone, String time){
    card.add(Card(
      country: timezone,
      timezone: timezone,
      iconSrc: 'assets/icons/Liberty.svg',
      time: time,
      period: 'PM',
    ));
    notifyListeners();
  }

  void deleteTask(int index){
      card.remove(card[index]);

  }

}