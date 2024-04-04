import 'package:flutter/material.dart';
import 'package:ud_vote/models/stats.dart';
import 'package:http/http.dart' as http;

class StatInfoProvider extends ChangeNotifier{

  //mobile ip connector = 192.168.0.36
  //emulator ip connector = 10.0.2.2
  static const url = 'http://10.0.2.2:8000/api/';

  bool isLoading = true;

  String error = '';

  CollegeInfo collegeInfo = CollegeInfo(collegeStats: []);

  getSelectedDataFromApi(int year) async {

    var requestParameter = 'stats?year=$year';

    var apiEndpoint = url + requestParameter;

    try{

      http.Response response = await http.get(Uri.parse(apiEndpoint));

      if(response.statusCode == 200){
        collegeInfo = collegeInfoFromJson(response.body);
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