import 'package:fitappson/main.dart';

import 'Login_Page.dart';
import 'package:flutter/material.dart';
import 'contants.dart';
import 'createAccountPage_1.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('images/homeback.jpg'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'APP NAME',
                style: TextStyle(
                  fontFamily: 'Rajdhani',
                  color: Colors.white,
                  fontSize: 50.0,
                ),
              ),
              Text(
                'Get in the shape of your life ',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontFamily: 'Rajdhani'),
              ),
              SizedBox(
                height: 100.0,
                width: 150.0,
              ),
              Text(
                'CONTINUE WITH ',
                style: TextStyle(
                    color: Colors.white, fontSize: 15, fontFamily: 'Rajdhani'),
              ),
              WelcomePageButton(
                  buttonTitle: 'LOG IN',
                  click: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => Login_Page()),
                    );
                    print('object');
                  },
                  buttonColor: kButtonColorGrey),
              WelcomePageButton(
                  buttonTitle: 'CREATE ACCOUNT',
                  click: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateAccount()),
                    );
                  },
                  buttonColor: kButtonColorGrey),
              Text(
                "- OR-",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontFamily: 'Rajdhani',
                ),
              ),
              WelcomePageButton(
                  buttonTitle: 'GMAİL',
                  click: null,
                  buttonColor: kButtonColorRed),
            ],
          ),
        ),
      ),
    );
  }
}
