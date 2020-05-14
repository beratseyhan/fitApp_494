import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitappson/notifier/hareketler_Notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Login_Page.dart';
import 'hareketlerDeneme.dart';

//class hark extends StatefulWidget {
//  @override
//  _harkState createState() => _harkState();
//}
//
//class _harkState extends State<hark> {
//  getExercise(ExerciseNotifier exerciseNotifier) async {
//    QuerySnapshot snapshot =
//        await Firestore.instance.collection('profile').getDocuments();
//    List<Exercise> _exerciseList = [];
//    snapshot.documents.forEach((document) {
//      Exercise exercise = Exercise.fromMap(document.data);
//      _exerciseList.add(exercise);
//    });
//    exerciseNotifier.exercisesList = _exerciseList;
//  }
//
//  @override
//  void initState() {
//    ExerciseNotifier exerciseNotifier =
//        Provider.of<ExerciseNotifier>(context, listen: false);
//    getExercise(exerciseNotifier);
//    super.initState();
//  }
//
//  Widget build(BuildContext context) {
//    @override
//    ExerciseNotifier exerciseNotifier = Provider.of<ExerciseNotifier>(context);
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('asda1s'),
//        ),
//        body: ListView.separated(
//          itemBuilder: (BuildContext context, int index) {
//            return ListTile(
//              title: Text(exerciseNotifier.exercisesList[index].name),
//              subtitle: Text(exerciseNotifier.exercisesList[index].category),
//            );
//          },
//          itemCount: exerciseNotifier.exercisesList.length,
//          separatorBuilder: (BuildContext context, int index) {
//            return Divider(
//              color: Colors.purple,
//            );
//          },
//        ));
//  }
//}
class hareketler extends StatefulWidget {
  @override
  _hareketlerState createState() => _hareketlerState();
}

class _hareketlerState extends State<hareketler> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _profile = [];
  bool loadingProfile = true;
  int _per_page = 15;
  int score;
  int index;
  DocumentSnapshot _lastdocument;
  ScrollController _scrollController = ScrollController();
  bool _gettingMoreProfile = false;
  bool _morePrdouctsAvaible = true;
  getExercise() async {
    Query q = _firestore.collection('exercise').limit(_per_page);
    setState(() {
      loadingProfile = true;
    });
//    .where('category', isEqualTo: 'low')   koşullu çagırma
    QuerySnapshot querySnapshot = await q.getDocuments();
    _profile = querySnapshot.documents;
    _lastdocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    setState(() {
      loadingProfile = false;
    });
  }

//  getMoreProfile() async {
//    if (_morePrdouctsAvaible == false) {
//      print('noo');
//    }
//    if (_morePrdouctsAvaible == true) {
//      print('yes');
//    }
//
//    _morePrdouctsAvaible = true;
//
//    Query q = _firestore
//        .collection('profile')
//        .orderBy('score', descending: true)
//        .startAfter([_lastdocument.data]).limit(_per_page);
//
//    QuerySnapshot querySnapshot = await q.getDocuments();
//    if (querySnapshot.documents.length < _per_page) {
//      _morePrdouctsAvaible = false;
//    }
//    _lastdocument = querySnapshot.documents[querySnapshot.documents.length - 1];
//    _profile.addAll(querySnapshot.documents);
//
//    setState(() {});
//    _gettingMoreProfile = false;
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExercise();
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;
//      if (maxScroll - currentScroll <= delta) {
//        getMoreProfile();
//      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leader Bord'),
      ),
      body: loadingProfile == true
          ? Container(
              child: Center(
                child: Text('Exerrcise'),
              ),
            )
//          : Container(
//              child: _profile.length == 0
//                  ? Center(
//                      child: Text('No profile'),
//                    )
//                  : ListView.builder(
//                      controller: _scrollController,
//                      itemCount: _profile.length,
//                      itemBuilder: (BuildContext ctx, int index) {
//                        return ListTile(
////                          leading: CircleAvatar(
////                              child: ClipOval(
////                            child: Image.network(_profile[index].data["url"]),
////                          )),
//                          title: Text(_profile[index].data["name"]),
//                        );
//                      })),

          : Container(
              child: _profile.length == 0
                  ? Center(
                      child: Text('No profile'),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: _profile.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        int rank = index + 1;
                        addExercise() async {
                          setState(() {
                            try {
                              dbReference
                                  .collection('profile')
                                  .document('$email')
                                  .updateData({
                                'done': [_profile[index].data["name"], 'asd']
                              });
                              print('asd');
                            } catch (e) {
                              print(e.toString());
                            }
                          });
                        }

                        return GestureDetector(
                          onTap: () {
                            print(_profile[index].data["id"]);

                            score = 5 * (_profile[index].data["id"]);
                            print('$score');
                            addExercise();
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 30.0),
                              color: Colors.purple,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      (_profile[index].data["name"]),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: 'Rajdhani'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      ('$rank'),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: 'Rajdhani'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'score :' +
                                          (_profile[index]
                                              .data["score"]
                                              .toString()),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: 'Rajdhani'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )),
                        );
                      })),
    );
  }
}
