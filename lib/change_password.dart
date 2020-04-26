import 'package:flutter/cupertino.dart';
import 'package:fitappson/s_change_password.dart';
import 'package:flutter/material.dart';
import 'package:fitappson/home.dart';
import 'package:fitappson/exercises.dart';
import 'package:fitappson/settings.dart';
import 'package:fitappson/add.dart';
import 'package:fitappson/more.dart';




class change_password extends StatefulWidget {
  @override
  _change_passwordState createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {
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
      ),
      body: Center(

        child: Container(
          alignment: Alignment.topCenter,
          width:303,
          height: 380,
          margin: const EdgeInsets.all(10.0),
          padding: EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.88),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text(
                "               Change your password",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Rajdhani',
                  color: Colors.black.withOpacity(0.67),
                ),
              ),
              Spacer(flex: 3),

              Text(

                "  Current Password:",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal,
                  fontSize: 14,
                  fontFamily: 'Rajdhani',
                  color: Colors.black.withOpacity(0.67),
                ),
              ),
              TextField(

                obscureText: true,
                style: TextStyle(color: Colors.grey, fontSize: 14,),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
                  hintStyle: TextStyle(color: Colors.grey,
                    fontSize: 1.0,
                    fontFamily: 'Rajdhani',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(137, 55, 150, 100),
                        width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(137, 55, 150, 100),
                  ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              Spacer(flex: 1),

              Text(
                "  New Password:",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal,
                  fontSize: 14,
                  fontFamily: 'Rajdhani',
                  color: Colors.black.withOpacity(0.67),
                ),
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.grey, fontSize: 14,),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),
                  hintStyle: TextStyle(color: Colors.grey,
                    fontSize: 1.0,
                    fontFamily: 'Rajdhani',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(137, 55, 150, 100),
                        width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(137, 55, 150, 100),
                  ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              Spacer(flex: 1),

              Text(
                "  Confrim New Password:",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal,
                  fontSize: 14,
                  fontFamily: 'Rajdhani',
                  color: Colors.black.withOpacity(0.67),
                ),
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.grey, fontSize: 14,),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:10.0,horizontal: 20.0),

                  hintStyle: TextStyle(color: Colors.grey,
                    fontSize: 1.0,
                    fontFamily: 'Rajdhani',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(137, 55, 150, 100),
                        width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(137, 55, 150, 100),
                  ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),

              Spacer(flex: 3),

              RaisedButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> s_change_password()),
                  ),
                },
                color: Color.fromRGBO(40, 132, 218, 100),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                elevation: 5.0,
                splashColor: Colors.grey,
                animationDuration: Duration(seconds: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30),
                ),
                child: Container(
                  width: 250,
                  height: 28,

                  child: Text("Change my password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.normal,
                      fontFamily: 'Rajdhani',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
    );
  }
}