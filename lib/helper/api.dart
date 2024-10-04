import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {


  Future<dynamic> get({required String url,@required String? token}) async {
    Map<String, String> headers = {};
    if(token!=null){
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    http.Response response = await http.get(Uri.parse('$url'),headers: headers);

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there are an error with status code ${response.statusCode} , ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/json',
    });
    if(token!=null){
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    http.Response response =
        await http.post(Uri.parse('$url'), body: body, headers: headers);

    if (response.statusCode == 200) {
      List  data = jsonDecode(response.body);
      print(data);
      return data ;
    } else {
      throw Exception(
          'there are an error with status code ${response.statusCode},${jsonDecode(response.body)}');
    }

  }

  Future<dynamic> put(
      {required String url,
        @required dynamic body,
        String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    print('url:$url...,body=$body...,token:$token...,');

    if(token!=null){
      headers.addAll({
        'Authorization':'Bearer $token'
      });
    }
    http.Response response =
    await http.post(Uri.parse('$url'), body: body, headers: headers);
    if (response.statusCode == 200) {

     List data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there are an error with status code ${response.statusCode},${jsonDecode(response.body)}');
    }

  }

}
