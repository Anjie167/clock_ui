import 'package:clock_UI/models/card_data.dart';
import 'package:clock_UI/screens/components/country_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardLists extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
          final card = Provider.of<CardData>(context, listen: false).card[index];
          return CountryCard(
            country: card.country,
            time: card.time,
            timezone: card.timezone,
            iconSrc: card.iconSrc,
            period: card.period,
              );
        },
          itemCount: Provider.of<CardData>(context, listen: false).card.length,
        );
      }
  }

