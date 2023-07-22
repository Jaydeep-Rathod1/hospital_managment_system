
import 'package:hospital_managment_system/app/data/providers/authentication_provider.dart';

class AuthenticationRepository {
  final AuthenticationProvider _apiProvider = AuthenticationProvider();

  Future<dynamic?> loginUser(Map<String, dynamic> data,url) async {
    return  _apiProvider.loginUser(data,url);
  }
}