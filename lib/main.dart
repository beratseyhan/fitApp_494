import 'package:flutter/material.dart';

import 'WelcomePage.dart';
import 'createAccountPage_1.dart';

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
