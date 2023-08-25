
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentController extends GetxController with GetSingleTickerProviderStateMixin{
  TextEditingController dateInput = TextEditingController();
  DateTime? selectedDate;
  RxInt selectedTabIndex = 0.obs;
  Rx<bool> isDisplaytab = false.obs;
  Rx<List<String>> morningtimeslots = Rx<List<String>>([]);
  Rx<List<String>> afternoontimeslots = Rx<List<String>>([]);
  Rx<List<String>> eveningtimeslots = Rx<List<String>>([]);
  Rx<int> isSelectedindexMorning = Rx(-1);
  Rx<int> isSelectedindexAfternoon = Rx(-1);
  Rx<int> isSelectedindexEvening = Rx(-1);
  TextEditingController dateinput = TextEditingController();

  var tabIndex = 0.obs;
  var pageController = PageController(initialPage: 0);

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    createbookTimeSlot();

  }




  createbookTimeSlot()async{
    DateTime now = DateTime.now();
    DateTime startmorningtime = DateTime(now.year, now.month, now.day, 9, 0, 0);
    DateTime endmorningtime = DateTime(now.year, now.month, now.day, 11, 0, 0);
    Duration step = Duration(minutes: 15);

    DateTime startafternoontime = DateTime(now.year, now.month, now.day, 13, 0, 0);
    DateTime endafternoontime = DateTime(now.year, now.month, now.day, 16, 0, 0);
    Duration afternoonstep = Duration(minutes: 15);

    DateTime starteveningtime = DateTime(now.year, now.month, now.day, 16, 0, 0);
    DateTime endeveningtime = DateTime(now.year, now.month, now.day, 18, 0, 0);
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
  void setSelectedMorningIndex(int index) {
    isSelectedindexMorning.value = index;
    isSelectedindexAfternoon.value = -1;
    isSelectedindexEvening.value = -1;
  }

  void setSelectedAfternoonIndex(int index) {
    isSelectedindexAfternoon.value = index;
    isSelectedindexMorning.value = -1;
    isSelectedindexEvening.value = -1;
  }

  void setSelectedEveningIndex(int index) {
    isSelectedindexEvening.value = index;
    isSelectedindexAfternoon.value = -1;
    isSelectedindexMorning.value = -1;
  }


}
