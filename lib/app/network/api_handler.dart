import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'error_handler.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static Future<dynamic> get(String url) async {
    print("url = ${url}");
    try {
      var response = await http.get(
        Uri.parse(url)
      );
      print("response get= ${response.statusCode}");
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure");
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }

  static Future<dynamic> post(url,{body}) async {
  print("url = ${url}");
  print("url = ${body}");
    try {
      var response = await http.post(
        Uri.parse(url),
        body: body,
        // headers: {'Content-Type': 'application/json; charset=UTF-8'},

      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      print("FormatException");
      throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      print("SocketException");
      throw ErrorHandler(message: "Internet Connection Failure");
    } on HttpException {
      print("HttpException");
      throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      print("Exception = ${ex.toString()}");
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }
// Api with Token

}
