import 'package:fitappson/profile_settings.dart';
import 'package:flutter/material.dart';

import 'Award.dart';
import 'Privacy.dart';
import 'WelcomePage.dart';
import 'createAccountPage_1.dart';
import 'exercises.dart';
import 'help.dart';

void main() => runApp(FirstPage());

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
