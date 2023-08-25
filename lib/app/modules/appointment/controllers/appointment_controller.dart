
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:intl/intl.dart';

class AppointmentController extends GetxController with GetSingleTickerProviderStateMixin{
  TextEditingController dateInput = TextEditingController();
  DateTime? selectedDate;
  Rx<String> selectedTime = "".obs;
  RxInt selectedTabIndex = 0.obs;
  Rx<bool> isDisplaytab = false.obs;
  Rx<List<String>> morningtimeslots = Rx<List<String>>([]);
  Rx<List<String>> afternoontimeslots = Rx<List<String>>([]);
  Rx<List<String>> eveningtimeslots = Rx<List<String>>([]);
  Rx<int> isSelectedindexMorning = Rx(-1);
  Rx<int> isSelectedindexAfternoon = Rx(-1);
  Rx<int> isSelectedindexEvening = Rx(-1);
  TextEditingController dateinput = TextEditingController();
  final usermodel = UserModel();
  var tabIndex = 0.obs;
  var pageController = PageController(initialPage: 0);
  Rx<Map<String, dynamic>> receivedData = Rx<Map<String, dynamic>>({});
  final userModel = UserModel().obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
  }
  final Map<String, dynamic> arguments = Get.arguments;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userModel.value = arguments['userData'];
    createbookTimeSlot();
  }
  createbookTimeSlot()async{
    DateTime now = DateTime.now();
    DateTime startmorningtime = DateTime(now.year, now.month, now.day, 9, 0, 0);
    DateTime endmorningtime = DateTime(now.year, now.month, now.day, 12, 15, 0);
    Duration step = Duration(minutes: 15);

    DateTime startafternoontime = DateTime(now.year, now.month, now.day, 13, 0, 0);
    DateTime endafternoontime = DateTime(now.year, now.month, now.day, 16, 0, 0);
    Duration afternoonstep = Duration(minutes: 15);

    DateTime starteveningtime = DateTime(now.year, now.month, now.day, 16, 0, 0);
    DateTime endeveningtime = DateTime(now.year, now.month, now.day, 19, 0, 0);
    Duration eveningstep = Duration(minutes: 15);

    while(startmorningtime.isBefore(endmorningtime)) {
      DateTime timeincrement = startmorningtime.add(step);
      // morningtimeslots.add(DateFormat('hh:mm a').format(startmorningtime));
      morningtimeslots.value.add(DateFormat.jm().format(startmorningtime));
      startmorningtime = timeincrement;
      update();
    }
    while(startafternoontime.isBefore(endafternoontime)) {
      DateTime timeincrement = startafternoontime.add(afternoonstep);
      afternoontimeslots.value.add(DateFormat.jm().format(startafternoontime));
      startafternoontime = timeincrement;
      update();
    }
    while(starteveningtime.isBefore(endeveningtime)) {
      DateTime timeincrement = starteveningtime.add(eveningstep);
      eveningtimeslots.value.add(DateFormat.jm().format(starteveningtime));
      starteveningtime = timeincrement;
      update();
    }
    update();
  }
  bool isTimeSlotEnabled(index) {
    DateTime currentTime = DateTime.now();
    print("currentTime = ${currentTime}");
    var currentFormattedTime = DateFormat.jm().format(currentTime);
    print("currentFormattedTime = ${currentFormattedTime}");
    var timeSlot = index;
    print("timeSlot = ${timeSlot}");
    var currentTimeFormatted = DateFormat.jm().parse(currentFormattedTime);
    var timeSlotFormatted = DateFormat.jm().parse(timeSlot);
    bool isPickedDateToday = DateFormat('yyyy-MM-dd').format(selectedDate!) ==
        DateFormat('yyyy-MM-dd').format(DateTime.now());
    if(isPickedDateToday){
      if (currentTimeFormatted.isBefore(timeSlotFormatted)) {
        return true; // Time slot is after the current time
      }
      else {
        return false; // Time slot is before the current time
      }
    }else{
      return true;
    }

  }
   setSelectedMorningIndex(int index) {
    isSelectedindexMorning.value = index;
    isSelectedindexAfternoon.value = -1;
    isSelectedindexEvening.value = -1;

  }

   setSelectedAfternoonIndex(int index) {
    isSelectedindexAfternoon.value = index;
    isSelectedindexMorning.value = -1;
    isSelectedindexEvening.value = -1;

  }

   setSelectedEveningIndex(int index) {
    isSelectedindexEvening.value = index;
    isSelectedindexAfternoon.value = -1;
    isSelectedindexMorning.value = -1;

  }
  bookSlot()async{
    // if()
    var selectedTime = "";
    if(selectedDate != null){
      if(isSelectedindexMorning.value != -1 || isSelectedindexAfternoon.value != -1 ||isSelectedindexEvening.value != -1){
        if(isSelectedindexMorning.value != -1){
          selectedTime = morningtimeslots.value[isSelectedindexMorning.value];
        }else if(isSelectedindexAfternoon.value != -1){
          selectedTime = afternoontimeslots.value[isSelectedindexAfternoon.value];
        }else if(isSelectedindexEvening.value != -1){
          selectedTime =eveningtimeslots.value[isSelectedindexEvening.value].toString();
        }
        print("selectedTime = ${selectedTime}");
        print("selectedDate = ${selectedDate}");
        print("doctor id = ${userModel.value.userId}");
        print("doctor id = ${userModel.value.departmentName}");
        final StorageManager _storage = StorageManager();
        UserModel userForModel =(await _storage.retrieveModelUser('userData'))!;
        print("login user = ${userForModel.userId}");
      }else{
        Get.snackbar(
          'Error',
          "Please Select Time",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
      }
    }else{
      Get.snackbar(
        'Error',
        "Please Select Date",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 3),
      );
    }
    print(userModel.value.userId);
  }

}
