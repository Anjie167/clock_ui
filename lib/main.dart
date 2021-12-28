import 'package:clock_UI/models/card_data.dart';
import 'package:clock_UI/models/my_theme_provider.dart';
import 'package:clock_UI/screens/home_screen.dart';
import 'package:clock_UI/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MyThemeModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => CardData(),
          ),
        ],
        child: Consumer<MyThemeModel>(
          builder: (context, theme, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Analog Clock',
              theme: themeData(context),
              darkTheme: darkThemeData(context),
              themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
              home: HomeScreen(),
            );
          },
        ));
  }

}
