import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitappson/home.dart';
import 'package:fitappson/more.dart';
import 'package:fitappson/add.dart';
import 'package:fitappson/exercises.dart';
import 'package:fitappson/settings.dart';

class achievements extends StatefulWidget {
  @override
  _achievementsState createState() => _achievementsState();
}

class _achievementsState extends State<achievements> {
  int _selectedIndex = 0;

  List<String> litems=[
    "Taking Small Steps\nRun for 100 meters.",
    "Getting Serious\nRun for 1000 meters.",
    "Now We Are Talking\nRun for 5000 meters.",
    "Do you even lift?\nLift 1 kg worth of weight.",
    "Up and Down\nSquatted 10 times.",
    "Easy There Fella\nSquatted 50 times.",
    "Like a Rollercoaster\nSquatted 250 times.",
    "Hello World\nCompleted your profile.",
    "Dragon Fire\nBurnt out 10,000 calories.",
    "Iron Man\nAchieve Now We Are Talking , Like a Rollercoaster , King of the Hill.",

  ];
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0XFFE5E5E5),
      appBar: new AppBar(
        backgroundColor: Color(0XFFE5E5E5),
        elevation: 0,
        leading: new Column(
          children: <Widget>[
            new IconButton(icon: Image.asset('images/back_icon.png',),
              onPressed: null,
              color: Colors.transparent,)
          ],
        ),
        title: new Column(
          children: <Widget>[
            Text(
              "\tAchievements                             ",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Rajdhani',
                color: Colors.black.withOpacity(0.67),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16, right:16),
              child: ListView.separated(
                itemBuilder: (context, index){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height:5,),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 50,
                            child: ClipRect(
                              child: Image.asset("images/Achievements/${index+1}.PNG",fit: BoxFit.scaleDown, ), ),),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(litems[index],
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Rajdhani',
                                    color: Colors.black.withOpacity(0.80),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: litems.length,
              ),
            ),
          )
        ],
      ),
      //Alt menü.
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(74, 70, 70, 80),),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: changePage,
          iconSize: 35,

          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(icon: Image.asset('images/home.png',),
                onPressed: () =>
                {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => home()),

                  ),
                },
                color: Colors.transparent,),
              title: SizedBox(
                height: 0,
              ),
            ),

            BottomNavigationBarItem(
              icon: IconButton(icon: Image.asset('images/menu.png',),
                onPressed: () =>
                {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => more()),
                  ),
                },
                color: Colors.transparent,),
              title: SizedBox(
                height: 0,
              ),
            ),

            BottomNavigationBarItem(
              icon: IconButton(icon: Image.asset(
                'images/plus.png', width: 50, height: 50,),
                onPressed: () =>
                {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => add()),

                  ),
                },
                color: Colors.transparent,),
              title: SizedBox(
                height: 0,
              ),
            ),

            BottomNavigationBarItem(
              icon: IconButton(icon: Image.asset('images/dumbbell.png',),
                onPressed: () =>
                {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => exercises()),
                  ),
                },
                color: Colors.transparent,),
              title: SizedBox(
                height: 0,
              ),
            ),

            BottomNavigationBarItem(
              icon: IconButton(icon: Image.asset('images/settings_active.png',),
                onPressed: () =>
                {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => settings()),
                  ),
                },
                color: Colors.transparent,),
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