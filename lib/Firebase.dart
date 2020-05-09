import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:fitappson/deneme.dart';

import 'package:flutter/material.dart';

final dbReference = Firestore.instance;

class Profile {
  String email;

  String name;
  String gender;
  String brith;
  int actvityLevel;
  int height;
  int weight;
  String url;

  Profile(this.name, this.gender, this.brith, this.actvityLevel, this.height,
      this.email, this.weight);

//  Profile.fromJson(var value) {
//    this.name = value['name'];
//    this.gender = value['gender'];
//    this.brith = value['brith'];
//    this.email = value['e-mail'];
//    this.actvityLevel = value['activityLevel'];
//    this.height = value['height'];
//    this.weight = value['weight'];
//  }
  void initState() async {
    dbReference
        .collection("profile")
        .where("e-mail", isEqualTo: "$email")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
      snapshot.documents.forEach((profileData) {
        gender = profileData.data["gender"];
        url = profileData.data["url"];
        actvityLevel = int.parse(profileData.data["activityLevel"]);
        print('$url');
      });
    });
  }
}

void deneme() async {}
