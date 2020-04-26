import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitappson/exercises.dart';
import 'Login_Page.dart';
import 'Progress_Page.dart';
import 'afterSingUp_Finish.dart';
import 'profile_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'afterSingUp_1.dart';
import 'afterSingUp_Finish.dart';
import 'contants.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

class homePage extends StatefulWidget {
  @override
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;
  int _index = 0;
  int photo;
  int levelint;

  String userMail;
//  final deneme = Firestore.instance;
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _userEmail;

  _getUserAuthEmail() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _userEmail = user.email;
      print('object deneme $email');
    });
  }

  final _fireStore = Firestore.instance;
  void getData() async {
    databaseReference
        .collection("profile")
        .where("e-mail", isEqualTo: "$email")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

//  void abc() async {
//    final profile = await deneme
//        .collection('profile')
//        .where("e-mail", isEqualTo: "$email")
//        .getDocuments();
//    for (var profile in profile.documents) {
//      print(profile.data);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      body: Container(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  children: <Widget>[
                    my_iconbutton(
                      iconImageName: 'images/back_icon.png',
                      click: () {
                        //  abc();

                        getData();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => afterSingUp_Finish()),
                        );
                      },
                    ),
                  ],
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: my_Iconbutton_Profile(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height:
                              MediaQuery.of(context).size.height * 0.15 * 0.8,
                          click: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profile_Page()),
                            );
                          },
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('profile')
                                        .document('$email')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return new Text("Loading");
                                      }
                                      var username = snapshot.data;

                                      var date = snapshot.data;

                                      return Column(
                                        children: <Widget>[
                                          new Text(
                                            username["name"],
                                            style: kNormalLabelTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          new Text(
                                            date["brith"],
                                            style: kNormalLabelTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      );
                                    }),
                                Text(
                                  'Lets get Exercise',
                                  style: kNormalLabelTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 1,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.transparent,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            iconSize:
                                MediaQuery.of(context).size.height * 0.15 * 0.5,
                            icon: Image.asset('images/bell.png'),
                            color: Colors.white,
                            onPressed: null,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => afterSingUp_Finish()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/finish1.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.purple,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      'Pilates',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '30 min',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/finish2.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Pilates',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '30 min',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/finish3.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Pilates',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '30 min',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/finish4.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    'Pilates',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '30 min',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  AutoSizeText(
                    'Popular',
                    style: kNormalLabelTextStyle,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 1 * 0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.purple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage(
                              "images/bicycle.png",
                            ),
                            color: Colors.white,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 1 * 0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.purple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage(
                              "images/bicycle.png",
                            ),
                            color: Colors.white,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 1 * 0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.purple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage(
                              "images/bicycle.png",
                            ),
                            color: Colors.white,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 1 * 0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.purple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage(
                              "images/bicycle.png",
                            ),
                            color: Colors.white,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 1 * 0.2,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.purple,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage(
                              "images/bicycle.png",
                            ),
                            color: Colors.white,
                          ),
                          Text(
                            'data',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Text(
                        '915',
                        style: TextStyle(
                            fontSize: 17.5, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'moves',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
                  Expanded(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                '30',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'min',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                      Container(
                          height: 90,
                          width: 1,
                          decoration: new BoxDecoration(
                            color: Colors.black,
                          )),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  '3600',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'ca',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
                ],
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Container(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(74, 70, 70, 80),
          ),
          child: Container(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: changePage,
              iconSize: 35,
              fixedColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset(
                      'images/home.png',
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => afterSingUp_Finish()),
                      ),
                    },
                    color: Colors.transparent,
                  ),
                  title: SizedBox(
                    height: 0,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset(
                      'images/menu.png',
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => afterSingUp_Finish()),
                      ),
                    },
                    color: Colors.transparent,
                  ),
                  title: SizedBox(
                    height: 0,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset(
                      'images/plus.png',
                      width: 50,
                      height: 50,
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => progress_Page()),
                      ),
                    },
                    color: Colors.transparent,
                  ),
                  title: SizedBox(
                    height: 0,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset(
                      'images/dumbbell.png',
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => exercises()),
                      ),
                    },
                    color: Colors.transparent,
                  ),
                  title: SizedBox(
                    height: 0,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Image.asset(
                      'images/settings_active.png',
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => afterSingUp_Finish()),
                      ),
                    },
                    color: Colors.transparent,
                  ),
                  title: SizedBox(
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
