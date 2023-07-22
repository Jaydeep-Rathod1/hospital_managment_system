import 'package:hospital_managment_system/app/data/providers/user_provider.dart';

class UserRepository {
  final UserProvider _apiProvider = UserProvider();

  Future<dynamic?> getDepartments(url) async {
    return  _apiProvider.getDepartments(url);
  }
}