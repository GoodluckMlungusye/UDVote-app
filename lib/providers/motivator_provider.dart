import 'package:flutter/material.dart';
import 'package:ud_vote/models/motivator.dart';
import 'package:http/http.dart' as http;

class MotivatorProvider extends ChangeNotifier{

  //mobile ip connector = 192.168.0.36
  //emulator ip connector = 10.0.2.2
  static const apiEndpoint = 'http://10.0.2.2:8000/api/motivators';

  bool isLoading = true;

  String error = '';

  Motivators motivators = Motivators(motivators: []);

  getDataFromApi() async {

    try{

      http.Response response = await http.get(Uri.parse(apiEndpoint));

      if(response.statusCode == 200){
        motivators = motivatorsFromJson(response.body);
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

