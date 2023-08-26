import 'package:hospital_managment_system/app/data/providers/user_provider.dart';

class UserRepository {
  final UserProvider _apiProvider = UserProvider();

  Future<dynamic?> getDepartments(url) async {
    return  _apiProvider.getDepartments(url);
  }
  Future<dynamic?> getDoctorByDepartments(url,params) async {
  return  _apiProvider.getDoctorByDepartments(url,params);
  }

  Future<dynamic?> getDashborad(url) async {
    return  _apiProvider.getDashborad(url);
  }

  Future<dynamic?> getAllDoctor(url) async {
    return  _apiProvider.getAllDoctor(url);
  }
  Future<dynamic?> addAppointment(Map<String, dynamic> params,url) async {
    return  _apiProvider.addAppointment(params,url);
  }
  Future<dynamic?> getAppointment(Map<String, dynamic> data,url) async {
    return  _apiProvider.getAppointment(data,url);
  }

  Future<dynamic?> getAllAppointmentByDoctot(Map<String, dynamic> data,url) async {
    return  _apiProvider.getAllAppointmentByDoctot(data,url);
  }
}