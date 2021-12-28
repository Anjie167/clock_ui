import 'package:clock_UI/widgets/country_list.dart';
import 'package:flutter/material.dart';
import 'clock.dart';
import 'time_in_hour_and_minute.dart';

Widget buildCard(){
  return CardLists();
}

class Body extends StatefulWidget {

  final String name;
  Body({this.name});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Text(
              widget.name,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TimeInHourAndMinute(),
            Spacer(),
            Clock(),
            Spacer(),
            Container(
              height:200,
                child: buildCard()
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: ,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

