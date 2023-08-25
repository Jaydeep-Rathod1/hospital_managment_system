
import 'package:hospital_managment_system/app/network/api_handler.dart';
import 'package:hospital_managment_system/app/network/error_handler.dart';

class AuthenticationProvider {
  Future<dynamic?> loginUser(Map<String, dynamic> data,url) async {
    try{
      var response = await ApiHandler.post(url, body: data);
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return error;
    }
  }
  Future<dynamic?> registerUser(Map<String, String> data,url,fieldName,filePath) async {
    try{
      var response = await ApiHandler.postWithImageNew(url, body: data,parameterName: fieldName,imagePath: filePath);
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      print("error = ${e}");
      final error = ErrorHandler(message: e.toString());
      return error;
    }
  }
  Future<dynamic?> forgotPassword(Map<String, dynamic> data,url) async {
    try{
      var response = await ApiHandler.post(url, body: data);
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return error;
    }
  }
  Future<dynamic?> resendOTP(Map<String, dynamic> data,url) async {
    try{
      var response = await ApiHandler.post(url, body: data);
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return error;
    }
  }
  Future<dynamic?> resetPassword(Map<String, dynamic> data,url) async {
    try{
      var response = await ApiHandler.post(url, body: data);
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return error;
    }
  }
  Future<dynamic?> editUser(Map<String, String> data,url,fieldName,filePath) async {
    try{
      var response = await ApiHandler.postWithImageEdit(url, body: data,parameterName: fieldName,imagePath: filePath);
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      print("error = ${e}");
      final error = ErrorHandler(message: e.toString());
      return error;
    }
  }
}