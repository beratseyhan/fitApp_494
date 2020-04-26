import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'afterSingUp_5.dart';
import 'afterSingUp_Finish.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contants.dart';

class afterSingUp_6 extends StatefulWidget {
  @override
  _afterSingUp_6State createState() => _afterSingUp_6State();
}

class _afterSingUp_6State extends State<afterSingUp_6> {
  int level = 2;
  final databaseReference = Firestore.instance;
  String _userEmail;
  _getUserAuthEmail() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _userEmail = user.email;

      try {
        databaseReference
            .collection('profile')
            .document('$_userEmail')
            .updateData({'activityLevel': '$level'});
      } catch (e) {
        print(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  children: <Widget>[
                    my_iconbutton(
                      iconImageName: 'images/back_icon.png',
                      click: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => afterSingUp_5()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AutoSizeText(
                      'What is your current activity level? ',
                      style: kBigLabelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Text(level.toString(), style: kLabelTextStyle),
                        Text('Inactive', style: kNormalLabelTextStyle),
                        Text('Middle', style: kNormalLabelTextStyle),
                        Text('Active', style: kNormalLabelTextStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                trackHeight: 5,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 30.0)),
                            child: Slider(
                                divisions: 2,
                                value: level.toDouble(),
                                min: 1,
                                max: 3,
                                activeColor: Color(0xFF893796),
                                inactiveColor: Color(0xFF8D8E98),
                                onChanged: (double newValue) {
                                  setState(() {
                                    level = newValue.round();
                                    print('$level');
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: CustomPaint(
                              size: Size(40, 40), painter: DrawTriangle()),
                        ),
                        Container(
                            child: Center(
                              child: AutoSizeText(
                                'I exercise occasionally, but I want to improve myself by doing more',
                                style: kNormalLabelTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            height: MediaQuery.of(context).size.width * 0.4,
                            width: MediaQuery.of(context).size.width * 0.8,
                            color: Colors.white),
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
                                builder: (context) => afterSingUp_Finish()),
                          );
                        },
                        buttonColor: kActiveCardColor)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
