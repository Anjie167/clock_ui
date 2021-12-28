import 'dart:async';
import 'package:clock_UI/Services/time.dart';
import 'package:clock_UI/Utilities/location.dart';
import 'package:clock_UI/models/card_data.dart';
import 'package:clock_UI/models/test.dart';
import 'package:clock_UI/screens/components/body.dart';
import 'package:clock_UI/screens/pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:clock_UI/size_config.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Location location = Location();
  TimeModel timer = TimeModel();
  String name = 'New York, USA';
  String time ;
  String message;
  int myTime;
  var timeData;
  var timeData1;
  bool nothing = true;

  Test test;





  @override
  void initState(){
    super.initState();

    Location location = Location();
    location.getCurrentLocation();
    updateUI();
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateUI2();
      buildCard();
    });
    //
  }




  void updateUI()async{
    timeData = await timer.getLocation();
    setState(() {
      if (timeData == null){
        name = 'New York, USA';
        return;
      }

      name = timeData['timeZone'];

    });



  }

  void updateUI2()async{
    time = '??:??';
    timeData1 = await timer.getCityTime(PopUp.timezone);
    setState(() {
      if (timeData1 == null){
        time = 'Error';
        return;
      }
      time = timeData1['time'];

      if(time != timeData1['time']){
        time = timeData1['time'];
        buildCard();
      }

    });

    Provider.of<CardData>(context, listen: false).getData();

  }


  @override
  Widget build(BuildContext context) {




    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(name: name,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(icon: SvgPicture.asset('assets/icons/Settings.svg',
        color: Theme.of(context).iconTheme.color,), onPressed: null),
      actions: [
        buildAddButton(context)
      ],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: InkWell(
            onTap: (){
              showDialog(context: context, child: PopUp(time: time,));
            },
            child: Container(
              width: getProportionateScreenWidth(32),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        );
  }
}




