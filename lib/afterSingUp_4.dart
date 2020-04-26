import 'contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Login_Page.dart';

import 'afterSingUp_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'contants.dart';

import 'afterSingUp_1.dart';
import 'afterSingUp_3.dart';
import 'afterSingUp_5.dart';

class afterSingUp_4 extends StatefulWidget {
  @override
  _afterSingUp_4State createState() => _afterSingUp_4State();
}

enum WeightType {
  Kg,
  Ibm,
}

WeightType selectedWeight = WeightType.Kg;
String strWeight = 'Kg';

String _userEmail;

class _afterSingUp_4State extends State<afterSingUp_4> {
  _getUserAuthEmail() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _userEmail = user.email;
      print('object deneme $email');
      try {
        databaseReference
            .collection('profile')
            .document('$_userEmail')
            .updateData({'weight': '$weight'});
      } catch (e) {
        print(e.toString());
      }
    });
  }

  int weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                SafeArea(
                  child: my_iconbutton(
                    iconsize: null,
                    iconBackgrundColor: null,
                    iconImageName: 'images/back_icon.png',
                    click: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => afterSingUp_3()),
                      );
                    },
                  ),
                ),
              ],
            )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text(
                      'Tell us about yourself!',
                      style: kBigLabelTextStyle,
                    ),
                  ],
                )),
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: () {
                          setState(() {
                            selectedWeight = WeightType.Kg;
                            strWeight = 'Kg';
                          });
                        },
                        child: Text(
                          'KG',
                          style: TextStyle(
                            color: selectedWeight == WeightType.Kg
                                ? Colors.white
                                : Colors.purple,
                          ),
                        ),
                        color: selectedWeight == WeightType.Kg
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.transparent)),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      new RaisedButton(
                        onPressed: () {
                          setState(() {
                            selectedWeight = WeightType.Ibm;
                            strWeight = 'IBM';
                          });
                        },
                        child: Text(
                          'IBM',
                          style: TextStyle(
                            color: selectedWeight == WeightType.Ibm
                                ? Colors.white
                                : Colors.purple,
                          ),
                        ),
                        color: selectedWeight == WeightType.Ibm
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.transparent)),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        height: 30,
                        width: 100,
                        child: TextField(
                          onChanged: (value) {
                            weight = int.parse(value);
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: kNormalLabelTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$strWeight',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Rajdhani",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                WelcomePageButton(
                    buttonTitle: 'Next',
                    click: () {
                      _getUserAuthEmail();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => afterSingUp_5()),
                      );
                    },
                    buttonColor: kActiveCardColor)
              ],
            ))
          ],
        ),
      ),
    );
  }
}