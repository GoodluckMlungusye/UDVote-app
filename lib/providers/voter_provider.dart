import 'package:flutter/material.dart';

class VoterProvider extends ChangeNotifier{

  int? voter_id;

  List<int> categoryIds = [];

  void addCategoryId(int categoryId){
    categoryIds.add(categoryId);
    notifyListeners();
  }

  bool categoryIsAdded(categoryId) {
    bool isAdded = categoryIds.contains(categoryId);
    if (isAdded) {
      notifyListeners();
    }
    return isAdded;
  }

}