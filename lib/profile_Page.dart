import 'package:fitappson/profile_settings.dart';

import 'homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'afterSingUp_Finish.dart';
import 'contants.dart';

class profile_Page extends StatefulWidget {
  @override
  _profile_PageState createState() => _profile_PageState();
}

class _profile_PageState extends State<profile_Page> {
  List<String> images = [
    'images/1.png',
    'images/2.png',
    'images/3.png',
    'images/4.png',
    'images/5.png',
  ];
  final List<Widget> _children = [];

  int _selectedIndex = 0;
  int _index = 0;
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      body: Container(
        child: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  my_iconbutton(
                    iconsize: null,
                    iconBackgrundColor: null,
                    iconImageName: 'images/back_icon.png',
                    click: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => homePage()),
                      );
                    },
                  ),
                  Text(
                    'Profile',
                    style: kNormalLabelTextStyle,
                  ),
                  my_iconbutton(
                    iconImageName: 'images/settings.png',
                    iconBackgrundColor: Colors.purple,
                    click: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => profile_settings()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: my_Iconbutton_Profile(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: (MediaQuery.of(context).size.height * 0.15) *
                              0.80,
                          click: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profile_Page()),
                            );
                          },
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              ' Sandra Mason',
                              style: kNormalLabelTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.location_on,
                                  color: Colors.purple,
                                ),
                                Text(
                                  'Los - Angeles',
                                  style: kNormalLabelTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.transparent,
                                    shape: CircleBorder(),
                                  ),
                                  child: my_iconbutton(
                                      iconsize: null,
                                      click: null,
                                      iconImageName: 'images/star.png',
                                      iconBackgrundColor: null)),
                            ],
                          ),
                          Text(
                            '200',
                            style: kNormalLabelTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      my_iconbutton(
                          iconsize: null,
                          click: null,
                          iconImageName: 'images/height.png',
                          iconBackgrundColor: null),
                      Column(
                        children: <Widget>[
                          Text(
                            '168 cm',
                            style: kBoldSmallTextStyle,
                          ),
                          Text(
                            'height',
                            style: kSmallTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      my_iconbutton(
                          iconsize: null,
                          click: null,
                          iconImageName: 'images/weight.png',
                          iconBackgrundColor: null),
                      Column(
                        children: <Widget>[
                          Text(
                            '66 Kg',
                            style: kBoldSmallTextStyle,
                          ),
                          Text(
                            'weight',
                            style: kSmallTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          my_iconbutton_Big(
                            click: null,
                            iconImageName: 'images/goal.png',
                            iconBackgrundColor: Colors.green[100],
                            iconsize:
                                MediaQuery.of(context).size.height * 0.2 * 0.4,
                          ),
                          Text(
                            'Goals Met',
                            style: kBoldSmallTextStyle,
                          ),
                          Text(
                            '20',
                            style: kBoldSmallTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          my_iconbutton_Big(
                            click: null,
                            iconImageName: 'images/reward.png',
                            iconBackgrundColor: Colors.blue[100],
                            iconsize:
                                MediaQuery.of(context).size.height * 0.2 * 0.4,
                          ),
                          Text(
                            'Badges Won',
                            style: kBoldSmallTextStyle,
                          ),
                          Text(
                            '6',
                            style: kBoldSmallTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          my_iconbutton_Big(
                            click: null,
                            iconImageName: 'images/exerciseTime.png',
                            iconBackgrundColor: Colors.red[100],
                            iconsize:
                                MediaQuery.of(context).size.height * 0.2 * 0.4,
                          ),
                          Text(
                            'Exercise Time',
                            style: kBoldSmallTextStyle,
                          ),
                          Text(
                            '231',
                            style: kBoldSmallTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.028,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.280,
              child: GridView.count(
                crossAxisCount: 4,
                children: new List<Widget>.generate(12, (index) {
                  return new GridTile(
                    child: new Card(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.purple[200],
                        child: new Center(
                          child: new Image.asset(
                            'images/$index.png',
                            height: 60,
                            width: 60,
                          ),
                        )),
                  );
                }),
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(74, 70, 70, 80),
        ),
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
                  'images/dumbbell.png',
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
    );
  }
}
