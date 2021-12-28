import 'package:clock_UI/models/card_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../size_config.dart';

class PopUp extends StatelessWidget {
  PopUp({ this.time});
  final String time;

  static String timezone;
  @override
  Widget build(BuildContext context) {

    return SimpleDialog(
      title: Text('New Country :', style: Theme.of(context).textTheme.headline4.copyWith(
          fontSize: getProportionateScreenWidth(16)
      ),
      ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  children: [
                    Material(
                      child: TextField(
                        onChanged: (value){
                          timezone = value;
                        },
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: getProportionateScreenWidth(16)
                        ),
                        decoration: InputDecoration(
                          hintText: 'IANA Time Zone',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: (){

                        Provider.of<CardData>(context, listen: false).addCard(timezone, time);
                        Navigator.pop(context);
                        print(Provider.of<CardData>(context, listen: false).card.length);

                      },
                      child: Text('Continue', style: Theme.of(context).textTheme.headline4.copyWith(
                          fontSize: getProportionateScreenWidth(20)
                      ),
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
    );
  }
}
