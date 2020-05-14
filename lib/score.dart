import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class leaderBord extends StatefulWidget {
  @override
  _leaderBordState createState() => _leaderBordState();
}

class _leaderBordState extends State<leaderBord> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _profile = [];
  bool loadingProfile = true;
  int _per_page = 15;

  DocumentSnapshot _lastdocument;
  ScrollController _scrollController = ScrollController();
  bool _gettingMoreProfile = false;
  bool _morePrdouctsAvaible = true;
  getProfile() async {
    Query q = _firestore
        .collection('profile')
        .orderBy('score', descending: true)
        .limit(_per_page);
    setState(() {
      loadingProfile = true;
    });

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
    getProfile();
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
                child: Text('Loading data'),
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
                        return GestureDetector(
                          onTap: null,
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
