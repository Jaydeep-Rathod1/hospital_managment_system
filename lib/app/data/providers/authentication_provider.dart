
import 'package:hospital_managment_system/app/network/api_handler.dart';
import 'package:hospital_managment_system/app/network/error_handler.dart';

class AuthenticationProvider {
  Future<dynamic?> loginUser(Map<String, dynamic> data,url) async {
    try{

      var response = await ApiHandler.post(url, body: data);
      print("response = ${response}");
      if(response != null){
        print("if");
        return response;
      }else{
        print("else");
        return  null;
      }
    }catch(e){
      final error = ErrorHandler(message: e.toString());
      return null;
    }
  }
}