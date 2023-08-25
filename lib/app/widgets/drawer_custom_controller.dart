import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';

class CustomDrawerController extends GetxController {
  // Add any state or methods you need for your drawer logic here
  final StorageManager _storage = StorageManager();
  UserModel userModel = UserModel();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("drawer init");
    retriveData();
  }
  retriveData()async{
    userModel =(await _storage.retrieveModelUser('userData'))!;
    update();
    refresh();
  }
}
