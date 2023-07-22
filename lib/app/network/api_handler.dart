import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'error_handler.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static GetConnect _getConnect = GetConnect();
  // Api without Token
  static Future<dynamic> get(String url) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'}
      );
      print("main res = ${response.statusCode}");
      if (response.statusCode == 200) {
        return response;
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

    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'}
        // contentType: "multipart/form-data"
      );
      print("here = ${response.body}");
      if (response.statusCode == 200) {
        return response;
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
// Api with Token

}
