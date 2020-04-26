import 'package:fitappson/exercises.dart';
import 'package:fitappson/home.dart';
import 'package:fitappson/more.dart';
import 'package:fitappson/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add.dart';



class Award extends StatefulWidget {
  @override
  AwardHomeState createState() => AwardHomeState();
}

class AwardHomeState extends State<Award> {
  int _selectedIndex = 0;
  final List <Widget> _children= [
  ];
  void changePage(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/arkaplan.jpg"), fit: BoxFit.cover)
            ),
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.transparent,

              appBar: new AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: new Column(
                  children: <Widget>[
                    new IconButton(icon: Image.asset('images/back_icon.png',),
                      onPressed: null,
                      color: Colors.transparent,)
                  ],
                ),

              ),
              body: Center(

                  child: Container(

                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        image: new DecorationImage(image: ExactAssetImage('images/winner.png'),
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,

                        ),

                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                          children: <Widget>[
                            Text(
                              "156 \n Kcal",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Rajdhani',
                                color: Colors.black.withOpacity(0.65),
                              ),
                            ),
                            Spacer(flex: 1),

                            Text(
                              "10 \n Exercise",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Rajdhani',
                                color: Colors.black.withOpacity(0.65),
                              ),
                            ),

                            Spacer(flex: 1),

                            Text(
                              "16:00 \n Time ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Rajdhani',
                                color: Colors.black.withOpacity(0.65),
                              ),
                            ),

                          ]
                      )
                  )
              ),


              bottomNavigationBar:Theme(
                data:Theme.of(context).copyWith(canvasColor: Color.fromRGBO(74, 70, 70, 80),),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _selectedIndex,
                  onTap: changePage,
                  iconSize: 35,

                  fixedColor: Colors.white,
                  items: [
                    BottomNavigationBarItem(
                      icon: IconButton(icon: Image.asset('images/home.png',),
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> home()),

                          ),
                        },
                        color: Colors.transparent,),
                      title: SizedBox(
                        height: 0,
                      ),
                    ),

                    BottomNavigationBarItem(
                      icon: IconButton(icon: Image.asset('images/menu.png',),
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> more()),
                          ),
                        },
                        color: Colors.transparent,),
                      title: SizedBox(
                        height: 0,
                      ),
                    ),

                    BottomNavigationBarItem(
                      icon: IconButton(icon: Image.asset('images/plus.png',width:50,height:50,),
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> add()),

                          ),
                        },
                        color: Colors.transparent,),
                      title: SizedBox(
                        height: 0,
                      ),
                    ),

                    BottomNavigationBarItem(
                      icon: IconButton(icon: Image.asset('images/dumbbell.png',),
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> exercises()),
                          ),
                        },
                        color: Colors.transparent,),
                      title: SizedBox(
                        height: 0,
                      ),
                    ),

                    BottomNavigationBarItem(
                      icon: IconButton(icon: Image.asset('images/settings_active.png',),
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> settings()),
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




            )
        )
    );

  }


}
