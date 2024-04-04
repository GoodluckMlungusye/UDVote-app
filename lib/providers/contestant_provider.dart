import 'package:flutter/material.dart';
import 'package:ud_vote/models/contestant.dart';
import 'package:http/http.dart' as http;

class ContestantProvider extends ChangeNotifier{

  //mobile ip connector = 192.168.0.36
  //emulator ip connector = 10.0.2.2
  static const url = 'http://10.0.2.2:8000/api/';

  bool isLoading = true;

  String error = '';

  CategoryContestants categoryContestants = CategoryContestants(categoryContestants: []);

  getDataFromApi(categoryName) async {

    var requestParameter = 'categoryContestants?category_name=$categoryName';

    var apiEndpoint = url + requestParameter;

    try{

      http.Response response = await http.get(Uri.parse(apiEndpoint));

      if(response.statusCode == 200){
        categoryContestants = categoryContestantsFromJson(response.body);
      }else{
        error = response.statusCode.toString();
      }
    }
    catch(e){
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

}