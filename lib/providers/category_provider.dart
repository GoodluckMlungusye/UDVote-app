import 'package:flutter/material.dart';
import 'package:ud_vote/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier{

  //mobile ip connector = 192.168.0.36
  //emulator ip connector = 10.0.2.2
  static const apiEndpoint = 'http://10.0.2.2:8000/api/categories';

  bool isLoading = true;

  String error = '';

  Categories categories = Categories(categories: []);

  getDataFromApi() async {

    try{

      http.Response response = await http.get(Uri.parse(apiEndpoint));

      if(response.statusCode == 200){
        categories = categoriesFromJson(response.body);
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

