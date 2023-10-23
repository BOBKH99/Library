import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:project/data/app_exception.dart';

import '../response/api_respone.dart';

class ApiService{
  dynamic responeJson;

  Future<dynamic> putApi(url, requestBody) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    print('request Body : $requestBody');
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode(requestBody);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('this is a response: $response');
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    }
    else {
      print(response.reasonPhrase);
      return false;
    }


  }
  Future<dynamic> postApi(url, object) async{
    print('asdasdasd : $object');
    var headers = {
      'Content-Type': 'text/plain'
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode(object);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print('asdasdasdasdas ${response.stream.bytesToString()}');
      var res = await response.stream.bytesToString();
      return json.decode(res);
    }
    else {
      print(response.reasonPhrase);
    }

  }
  Future<dynamic> getAllRespone(String url) async{
    try{
      var respone = await http.get(Uri.parse(url));
      responeJson = returnRespone(respone);
    }on SocketException{
      throw FetchDataExeption('No internet connetion please check your internet ');
    }
    return responeJson;
  }
  dynamic returnRespone(http.Response respone) {
    switch(respone.statusCode){
      case 200:
        print('jsonDecode :  ${jsonDecode(respone.body)}');
        return jsonDecode(respone.body);
      case 500:
        print('it is an error');
        throw BadRequestEception('please check your request body');
    }
  }
}