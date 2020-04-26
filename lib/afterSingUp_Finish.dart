import 'package:auto_size_text/auto_size_text.dart';
import 'afterSingUp_6.dart';
import 'homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'contants.dart';

class afterSingUp_Finish extends StatefulWidget {
  @override
  _afterSingUp_FinishState createState() => _afterSingUp_FinishState();
}

class _afterSingUp_FinishState extends State<afterSingUp_Finish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFE5E5E5),
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    child: Row(
                      children: <Widget>[
                        my_iconbutton(
                          iconImageName: 'images/back_icon.png',
                          click: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => afterSingUp_6()),
                            );
                          },
                        ),
                      ],
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Here is your plan',
                        style: kNormalLabelTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            child: Center(
                              child: AutoSizeText(
                                'I exercise occasionally, but I want to improve myself by doing more',
                                textAlign: TextAlign.center,
                                style: kNormalLabelTextStyle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Stack(
                        overflow: Overflow.visible,
//                        alignment: Alignment.bottomRight,
                        alignment: Alignment(5, 8),
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(1000),
                            width: MediaQuery.of(context).size.width * 1 / 2.2,
                            height:
                                MediaQuery.of(context).size.height * 0.3 / 2.7,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: AssetImage('images/finish1.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1 / 2.8,
                            height:
                                MediaQuery.of(context).size.height * 0.3 / 3.2,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: AssetImage('images/finish0.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1 / 3,
                            height:
                                MediaQuery.of(context).size.height * 0.3 / 3.6,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: AssetImage('images/finish3.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1 / 3.3,
                            height:
                                MediaQuery.of(context).size.height * 0.3 / 4,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: AssetImage('images/finish4.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 1 / 3.7,
                            height:
                                MediaQuery.of(context).size.height * 0.3 / 4.5,
                            decoration: BoxDecoration(
                              color: const Color(0xff7c94b6),
                              image: const DecorationImage(
                                image: AssetImage('images/finish1.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
//                SizedBox(
//                  height: MediaQuery.of(context).size.height * 0.01,
//                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: AutoSizeText(
                              'Daily Calories',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          Container(
                            child: AutoSizeText(
                              '1300 KCAL',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: AutoSizeText(
                              'Trainings',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          Container(
                            child: AutoSizeText(
                              '2 / WEEK',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: AutoSizeText(
                              'Exercise Time',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          Container(
                            child: AutoSizeText(
                              '20 SEC',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: AutoSizeText(
                              'Goal',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          Container(
                            child: AutoSizeText(
                              '52 KG',
                              textAlign: TextAlign.start,
                              style: kNormalLabelTextStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        WelcomePageButton(
                            buttonTitle: 'LET S START',
                            click: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()),
                              );
                            },
                            buttonColor: kActiveCardColor)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
