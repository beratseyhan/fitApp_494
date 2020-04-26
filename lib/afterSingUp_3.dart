import 'Login_Page.dart';
import 'afterSingUp_1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'afterSingUp_4.dart';
import 'contants.dart';
import 'afterSingUp_2.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';

class afterSingUp_3 extends StatefulWidget {
  @override
  _afterSingUp_3State createState() => _afterSingUp_3State();
}

enum DistanceType {
  cm,
  fit,
}
int height;
DistanceType selectedDistance = DistanceType.cm;
String str = 'Cm';

class _afterSingUp_3State extends State<afterSingUp_3> {
  @override
  void updateData() {
    try {
      databaseReference
          .collection('profile')
          .document('$email')
          .updateData({'height': '$height'});
    } catch (e) {
      print(e.toString());
    }
  }

  _getUserAuthEmail() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _userEmail = user.email;
      print('object deneme $email');
      try {
        databaseReference
            .collection('profile')
            .document('$_userEmail')
            .updateData({'height': '$height'});
      } catch (e) {
        print(e.toString());
      }
    });
  }

  String _userEmail;
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
                    iconImageName: 'images/back_icon.png',
                    click: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => afterSingUp_2()),
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
                            selectedDistance = DistanceType.cm;
                            str = 'Cm';
                          });
                        },
                        child: Text(
                          'Cm',
                          style: TextStyle(
                            color: selectedDistance == DistanceType.cm
                                ? Colors.white
                                : Colors.purple,
                          ),
                        ),
                        color: selectedDistance == DistanceType.cm
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
                            selectedDistance = DistanceType.fit;
                            str = 'Fit';
                          });
                        },
                        child: Text(
                          'Fit',
                          style: TextStyle(
                            color: selectedDistance == DistanceType.fit
                                ? Colors.white
                                : Colors.purple,
                          ),
                        ),
                        color: selectedDistance == DistanceType.fit
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
                            height = int.parse(value);
                          },
                          textInputAction: TextInputAction.done,
                          style: kNormalLabelTextStyle,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          maxLength: 3,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '$str',
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
                            builder: (context) => afterSingUp_4()),
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
