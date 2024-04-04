import 'package:flutter/material.dart';
import 'package:ud_vote/models/results.dart';
import 'package:ud_vote/models/contestant_votes.dart';
import 'package:http/http.dart' as http;

class ResultsProvider extends ChangeNotifier{

  //mobile ip connector = 192.168.0.36
  //emulator ip connector = 10.0.2.2
  static const url = 'http://10.0.2.2:8000/api/';

  bool isLoading = true;

  String error = '';

  Results results = Results(countVoters: 0, displayContestants: [], countContestants: 0, countCategoryTotalVotes: 0);

  Votes votes = Votes(countContestantVotes: 0);


  getDataFromApi(String categoryName) async{

    var requestParameter = 'results?category_name=$categoryName';

    var apiEndpoint = url + requestParameter;

    try{

      http.Response response = await http.get(Uri.parse(apiEndpoint));

      if(response.statusCode == 200){
        results = resultsFromJson(response.body);
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


  getVotes(int contestantId) async{

    var requestParameter = 'contestantVotes?contestant_id=$contestantId';

    var apiEndpoint = url + requestParameter;

    try{

      http.Response response = await http.get(Uri.parse(apiEndpoint));

      if(response.statusCode == 200){
        votes = votesFromJson(response.body);
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