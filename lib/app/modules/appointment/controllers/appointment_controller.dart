
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
  int isSelectedindexMorning = -1;
  int isSelectedindexAfternoon = -1;
  int isSelectedindexEvening = -1;
  TextEditingController dateinput = TextEditingController();
  TabController? tabController;
  var tabIndex = 0.obs;
  var pageController = PageController();

  void changeTabIndex(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
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
    selectedMorningIndex.value = index;
  }

  void setSelectedAfternoonIndex(int index) {
    selectedAfternoonIndex.value = index;
  }

  void setSelectedEveningIndex(int index) {
    selectedEveningIndex.value = index;
  }
  morningSlots(){
      Obx(() => GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: morningtimeslots.value.length,
          itemBuilder: (BuildContext ctx, index) {
            bool isEnabled = isTimeSlotEnabled(morningtimeslots.value[index]);

            return InkWell(
              onTap: isEnabled? (){
                print("isEnabled = ${isEnabled}");

                isSelectedindexAfternoon = -1;
                isSelectedindexMorning = index;
                isSelectedindexEvening = -1;

              }:null,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(color: isEnabled? isSelectedindexMorning == index? Colors.blueAccent:Colors.amber:Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(morningtimeslots.value[index]),
              ),
            );
          }));
  }
  afternoonSlots(){
    GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: afternoontimeslots.value.length,
          itemBuilder: (BuildContext ctx, index) {
            bool isPickedDateToday = DateFormat('yyyy-MM-dd').format(selectedDate!) ==
                DateFormat('yyyy-MM-dd').format(DateTime.now());
            bool isEnabled = isTimeSlotEnabled(afternoontimeslots.value[index]);
            return InkWell(
              onTap:isEnabled? (){

                  isSelectedindexAfternoon = index;
                  isSelectedindexMorning = -1;
                  isSelectedindexEvening = -1;

                print("isEnabled = ${isEnabled}");
              }:null,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                    border: Border.all(color: isEnabled? isSelectedindexAfternoon == index? Colors.blueAccent:Colors.amber:Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(afternoontimeslots.value[index]),
              ),
            );
          });
  }
  eveningSlots(){
    GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: eveningtimeslots.value.length,
          itemBuilder: (BuildContext ctx, index) {
            bool isEnabled = isTimeSlotEnabled(eveningtimeslots.value[index]);
            return InkWell(
              onTap:isEnabled? (){
                print("isEnabled = ${isEnabled}");

                  isSelectedindexAfternoon = -1;
                  isSelectedindexMorning = -1;
                  isSelectedindexEvening = index;

              }:null,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: isEnabled?isSelectedindexEvening == index? Colors.blueAccent:Colors.amber:Colors.grey),
                    borderRadius: BorderRadius.circular(15)),
                child: Text(eveningtimeslots.value[index]),
              ),
            );
          });
  }

}
