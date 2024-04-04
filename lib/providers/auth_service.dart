import 'dart:convert';
import 'package:http/http.dart' as http;


class Authenticate {
//10.0.2.2 emulator 192.168.0.36 device
  final String url = "http://10.0.2.2:8000/api/";

  postData(data,apiUrl) async{

    var fullUrl = url + apiUrl;

    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: setHeaders(),
    );
  }

  setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

}