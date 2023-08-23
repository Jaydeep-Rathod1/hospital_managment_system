
import 'package:hospital_managment_system/app/data/providers/authentication_provider.dart';

class AuthenticationRepository {
  final AuthenticationProvider _apiProvider = AuthenticationProvider();

  Future<dynamic?> loginUser(Map<String, dynamic> data,url) async {
    return  _apiProvider.loginUser(data,url);
  }

  Future<dynamic?> regsiterUser(Map<String, String> data,url,fieldName,filePath) async {
    return  _apiProvider.registerUser(data,url,fieldName,filePath);
  }

  Future<dynamic?> forgotPassword(Map<String, dynamic> data,url) async {
    return  _apiProvider.forgotPassword(data,url);
  }

  Future<dynamic?> resendOTP(Map<String, dynamic> data,url) async {
    return  _apiProvider.resendOTP(data,url);
  }

  Future<dynamic?> resetPassword(Map<String, dynamic> data,url) async {
    return  _apiProvider.resetPassword(data,url);
  }
}