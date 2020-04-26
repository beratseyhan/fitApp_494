import 'Login_Page.dart';
import 'afterSingUp_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'contants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

enum Gender {
  male,
  famele,
}
final databaseReference = Firestore.instance;

class afterSingUp_1 extends StatefulWidget {
  @override
  _afterSingUp_1State createState() => _afterSingUp_1State();
}

class _afterSingUp_1State extends State<afterSingUp_1> {
  final _fireStore = Firestore.instance;
//  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Gender selectedGender = Gender.male;

  String _userEmail;

  _getUserAuthEmail() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    setState(() {
      _userEmail = user.email;
      print('object deneme $email');

      try {
        databaseReference
            .collection('profile')
            .document('$_userEmail')
            .updateData({'gender': '$selectedGender'});
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void updateData() {
    try {
      databaseReference
          .collection('profile')
          .document('$email')
          .updateData({'gender': '$selectedGender'});
    } catch (e) {
      print(e.toString());
    }
  }

//  void createRecord() async {
//    await databaseReference
//        .collection("profile")
//        .document('beratsyhnn@gmail.com')
//        .setData({
//      'gender': '$selectedGender',
//    });
//
//    DocumentReference ref = await databaseReference.collection("gender").add({
//      'gender': 'Flutter in Action',
//    });
//    print(ref.documentID);
//  }

//  FirebaseUser loggedInUser;
//  final _auth = FirebaseAuth.instance;

//  void getCurrentUser() async {
//    try {
//      final user = await _auth.currentUser();
//      if (user != null) {
//        loggedInUser = user;
//        print('$loggedInUser sadasdad');
//      }
//    } catch (e) {
//      print(e);
//    }
//  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE5E5E5),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                // my_Iconbutton(),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            Text(
              'Tell us about yourself!',
              style: kBigLabelTextStyle,
            ),
            SizedBox(
              height: 90,
            ),
            Column(
              children: <Widget>[
                kchoseeButton(
                  buttonTitle: 'Male',
                  click: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  buttonColor: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  TextColor: selectedGender == Gender.famele
                      ? Colors.purple
                      : Colors.white,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                kchoseeButton(
                  buttonTitle: 'Famele',
                  click: () {
                    setState(() {
                      selectedGender = Gender.famele;
                    });
                  },
                  buttonColor: selectedGender == Gender.famele
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  TextColor: selectedGender == Gender.famele
                      ? Colors.white
                      : Colors.purple,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  WelcomePageButton(
                      buttonTitle: 'NEXT',
                      click: () {
//                        _fireStore.collection('profile').add({
//                          'gender': selectedGender.toString(),
//                        });

//
//

                        //  updateData();
//                        updateData();
                        _getUserAuthEmail();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => afterSingUp_2()),
                        );
                      },
                      buttonColor: kActiveCardColor)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
