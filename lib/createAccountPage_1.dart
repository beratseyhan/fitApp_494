import 'afterSingUp_1.dart';
import 'afterSingUp_6.dart';
import 'contants.dart';
import 'package:flutter/material.dart';
import 'Login_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _fireStore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String name;
  String email;
  String password;
  String rePassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('images/createAccount_1.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    width: 600,
                    height: 600,
                    child: Card(
                      margin: EdgeInsets.all(20),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Create your free account",
                            style: kLabelTextStyle,
                          ),
                          TextField_CreateAccount(
                            onChangeValue: (value) {
                              name = value;
                              print(name);
                            },
                            inputType: TextInputType.text,
                            textSEE: false,
                            fildText: 'Enter full name',
                            TextFieldColor: Colors.white,
                            marginTop: 80,
                          ),
                          TextField_CreateAccount(
                            onChangeValue: (value) {
                              email = value;
                            },
                            inputType: TextInputType.emailAddress,
                            fildText: 'Enter E-mail',
                            textSEE: false,
                            TextFieldColor: Colors.white,
                            marginTop: 20,
                          ),
                          TextField_CreateAccount(
                            onChangeValue: (value) {
                              password = value;
                              print(password);
                            },
                            inputType: TextInputType.text,
                            fildText: 'Password',
                            TextFieldColor: Colors.white,
                            marginTop: 20,
                            textSEE: true,
                          ),
                          TextField_CreateAccount(
                            onChangeValue: (value) {
                              rePassword = value;
                              print(rePassword);
                            },
                            inputType: TextInputType.text,
                            fildText: 'Re-password',
                            TextFieldColor: Colors.white,
                            marginTop: 20,
                            textSEE: true,
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          WelcomePageButton(
                              buttonTitle: 'SIGN UP',
                              click: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                try {
                                  final newUser = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  _fireStore
                                      .collection('profile')
                                      .document('$email')
                                      .setData({
                                    'name': name,
                                    'e-mail': email,
                                  });
                                  if (newUser != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              afterSingUp_1()),
                                    );
                                  }
                                  setState(() {
                                    showSpinner = false;
                                  });
                                } catch (e) {
                                  print(e);
                                }
                              },
                              buttonColor: Color(0XFF2884DA)),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "Already have an account ? ",
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login_Page()),
                              );
                            },
                            child: Text(
                              "Log in",
                              style: kLabelTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
