import 'dart:collection';

import 'package:fitappson/exercises.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitappson/hareketlerDeneme.dart';

class ExerciseNotifier with ChangeNotifier {
  List<Exercise> _ExerciseList = [];
  Exercise _currentExercise;
  UnmodifiableListView<Exercise> get exercisesList =>
      UnmodifiableListView(_ExerciseList);
  Exercise get currentExercise => _currentExercise;
  set exercisesList(List<Exercise> exerciseList) {
    _ExerciseList = exercisesList;
    notifyListeners();
  }

  set currentExercise(Exercise exercise) {
    currentExercise = exercise;
    notifyListeners();
  }
}
