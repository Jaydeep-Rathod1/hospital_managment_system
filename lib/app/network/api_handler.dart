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

  static Future<dynamic> postWithImage(url, {Map<String, dynamic>? body,imagePath,String? parameterName}) async {
    print("url = $url");
    print("body = $body");
    print("imagePath = $imagePath");
    print("parameterName = $parameterName");

    try {
      var header = {
        "Content-Type": 'multipart/form-data',
        "Accept": 'application/json',
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );
      request.headers.addAll(header);
      // Add fields to the request body
      if (body != null) {
        body.forEach((key, value) {
          request.fields[key] = value.toString();
        });
      }

      // Add the image file to the request using fromPath
     /* if (imagePath != null) {
        // request.files.add(
        //   await http.MultipartFile.fromPath(
        //     parameterName!, // Field name in the form
        //     imagePath,
        //     // contentType: MediaType('image', 'jpeg'), // Adjust content type based on your image type
        //   ),
        // );
        request.files.add(http.MultipartFile(
            'profile_picture',
            imagePath.readAsBytes().asStream(),
            imagePath.lengthSync(),
            filename: imagePath.path.split('/').last)
        );
      }*/
      if (imagePath != null) {
        print("imagepath not null");
        request.files.add(
          await http.MultipartFile.fromPath(
            parameterName ?? 'profile_picture', // Field name in the form
            imagePath,
            // contentType: MediaType('image', 'jpeg'), // Adjust content type based on your image type
          ),
        );
      }

      var response = await request.send();
      print("response = ${response.statusCode}");
      print("response - ${response.stream.bytesToString()}");
      print("response = ${response.runtimeType}");

      if (response.statusCode == 200) {
        return json.decode(await response.stream.bytesToString());
      } else {
        print("else eroorr");
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
      print("ex = ${ex}");
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }

  static Future<dynamic> postWithImageNew(url, {Map<String, String>? body,imagePath,String? parameterName}) async {
    print("url = $url");
    print("body = $body");
    print("imagePath = $imagePath");
    print("parameterName = $parameterName");

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      request.files.add(
        http.MultipartFile(
          'profile_picture',
          imagePath.readAsBytes().asStream(),
          imagePath.lengthSync(),
          filename: imagePath.path.split('/').last,
        ),
      );
      request.headers.addAll(headers);
      request.fields.addAll(body!);
      print("request: " + request.toString());
      var res = await request.send();
      print("res = ${res}");
      http.Response response = await http.Response.fromStream(res);
      print("response = ${response}");
      if (response.statusCode == 200) {
        // Convert response body to JSON
        Map<String, dynamic> responseData = json.decode(response.body);
        return responseData;
      } else {
        // Map<String, dynamic> responseData = json.decode(response.body);
        // return responseData;
        print("Request failed with status: ${response.statusCode}");
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
      print("ex = ${ex}");
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }
// Api with Token

}
