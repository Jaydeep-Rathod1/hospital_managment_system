
import 'package:hospital_managment_system/app/network/api_handler.dart';
import 'package:hospital_managment_system/app/network/error_handler.dart';

class UserProvider {
  Future<dynamic?> getDepartments(url) async {
    try{
      var response = await ApiHandler.get(url);
      print("here = ${response}");
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return null;
    }
  }
  Future<dynamic?> getDoctorByDepartments(url,params) async {
    try{
      var response = await ApiHandler.post(url,body: params);
      print("here = ${response}");
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return null;
    }
  }

  Future<dynamic?> getDashborad(url) async {
    try{
      var response = await ApiHandler.get(url);
      print("here = ${response}");
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return null;
    }
  }
  Future<dynamic?> getAllDoctor(url) async {
    try{
      var response = await ApiHandler.get(url);
      print("here = ${response}");
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return null;
    }
  }
  Future<dynamic?> addAppointment(Map<String, dynamic> data,url) async {
    try{
      var response = await ApiHandler.post(url,body: data);
      print("here = ${response}");
      if(response != null){
        return response;
      }else{
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return null;
    }
  }
  Future<dynamic?> getAppointment(Map<String, dynamic> data,url) async {
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
  Future<dynamic?> getAllAppointmentByDoctot(Map<String, dynamic> data,url) async {
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

}