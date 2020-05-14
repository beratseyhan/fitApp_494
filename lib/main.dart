import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'WelcomePage.dart';
import 'createAccountPage_1.dart';
import 'notifier/hareketler_Notifier.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => ExerciseNotifier())
      ],
      child: FirstPage(),
    ));

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcome(),
      routes: {
        '/createAccount_1': (context) => CreateAccount(),
      },
    );
  }
}
