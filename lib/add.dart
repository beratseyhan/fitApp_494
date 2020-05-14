import 'package:flutter/cupertino.dart';
import 'package:fitappson/shoulder.dart';
import 'package:flutter/material.dart';
import 'package:fitappson/home.dart';
import 'package:fitappson/add.dart';
import 'package:fitappson/exercises.dart';
import 'package:fitappson/settings.dart';
import 'package:intl/intl.dart';
import 'package:fitappson/more.dart';

class add extends StatefulWidget {
  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  bool checkBoxValue = false;
  bool checkBoxValuetwo = false;
  bool checkBoxValuethree = false;
  bool checkBoxValuefour = false;
  bool checkBoxValuefive = false;
  bool checkBoxValuesix = false;
  DateTime _currentdate = new DateTime.now();

  int _selectedIndex = 0;
  final List<Widget> _children = [];
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _statusSel;

  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();

    items.add(new DropdownMenuItem(value: '1', child: new Text('5 min')));
    items.add(new DropdownMenuItem(value: '2', child: new Text('10 min')));
    items.add(new DropdownMenuItem(value: '3', child: new Text('15 min')));
    items.add(new DropdownMenuItem(value: '4', child: new Text('20 min')));
    items.add(new DropdownMenuItem(value: '5', child: new Text('25 min')));
    items.add(new DropdownMenuItem(value: '6', child: new Text('30 min')));
    items.add(new DropdownMenuItem(value: '7', child: new Text('35 min')));
    items.add(new DropdownMenuItem(value: '8', child: new Text('40 min')));
    items.add(new DropdownMenuItem(value: '9', child: new Text('45 min')));
    items.add(new DropdownMenuItem(value: '10', child: new Text('50 min')));
    items.add(new DropdownMenuItem(value: '11', child: new Text('55 min')));
    items.add(new DropdownMenuItem(value: '12', child: new Text('60 min')));
    return items;
  }

  void changedDropDownItem(String selectedItem) {
    setState(() {
      _statusSel = selectedItem;
    });
  }

  @override
  void initState() {
    _dropDownMenuItems = _getDropDownMenuItems();
    _statusSel = _dropDownMenuItems[0].value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _formattdate = new DateFormat.yMMMd().format(_currentdate);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0XFFE5E5E5),
      appBar: new AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        elevation: 0,
        leading: new Column(
          children: <Widget>[
            new IconButton(
              icon: Image.asset(
                'images/back_icon.png',
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => shoulder()),
                ),
              },
              color: Colors.transparent,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 20,
                  height: 70,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 303,
                  height: 70,
                  margin: const EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: new BoxDecoration(
                    color: Colors.white.withOpacity(0.37),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add_box, size: 30, color: Colors.purple),
                      Container(
                        width: 15,
                        alignment: Alignment.topCenter,
                      ),
                      Text(
                        "Come on, Add your activities today!",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: 'Rajdhani',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Center(
              child: Text(
                '$_formattdate',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Rajdhani',
                  color: Colors.black.withOpacity(0.80),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Text(
              '         Today Tasks',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Rajdhani',
                color: Colors.purple,
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Row(
              children: <Widget>[
                Text(
                  "           Walking",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Container(
                  width: 165,
                ),
                DropdownButton(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                  value: _statusSel,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Container(
              height: 20,
            ),
            Text(
              '         Exercises',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Rajdhani',
                color: Colors.purple,
              ),
            ),
            Container(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Row(
              children: <Widget>[
                Text(
                  "           Shoulder Exercises",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Container(
                  width: 130,
                ),
                Checkbox(
                  value: checkBoxValue,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValue = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Row(
              children: <Widget>[
                Text(
                  "           Arm Exercises",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Container(
                  width: 162,
                ),
                Checkbox(
                  value: checkBoxValuetwo,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValuetwo = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Row(
              children: <Widget>[
                Text(
                  "           Six Pack Exercises",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Container(
                  width: 134,
                ),
                Checkbox(
                  value: checkBoxValuethree,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValuethree = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Row(
              children: <Widget>[
                Text(
                  "           Leg Exercises",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Container(
                  width: 164,
                ),
                Checkbox(
                  value: checkBoxValuefour,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValuefour = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Row(
              children: <Widget>[
                Text(
                  "           Chest Exercises",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Container(
                  width: 150,
                ),
                Checkbox(
                  value: checkBoxValuefive,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValuefive = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              height: 1.0,
              color: Colors.grey.shade400,
            ),
            Row(
              children: <Widget>[
                Text(
                  "           Back Exercises",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Rajdhani',
                    color: Colors.black.withOpacity(0.67),
                  ),
                ),
                Container(
                  width: 157,
                ),
                Checkbox(
                  value: checkBoxValuesix,
                  onChanged: (bool value) {
                    setState(() {
                      checkBoxValuesix = value;
                    });
                  },
                  activeColor: Colors.purple,
                ),
              ],
            ),
            Container(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 135,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () {},
                  child: Container(
                    width: 40,
                    height: 30,
                    child: Center(
                      child: Text(
                        "Save",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'Rajdhani',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  color: Colors.purple,
                ),
              ],
            ),
            Container(
              height: 30,
            ),
          ],
        ),
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
                    MaterialPageRoute(builder: (context) => home()),
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
                    MaterialPageRoute(builder: (context) => more()),
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
                    MaterialPageRoute(builder: (context) => add()),
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
                    MaterialPageRoute(builder: (context) => settings()),
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
