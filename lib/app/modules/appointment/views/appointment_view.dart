import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';
import 'package:intl/intl.dart';

import '../controllers/appointment_controller.dart';

class AppointmentView extends GetView<AppointmentController>  {
  const AppointmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Book Appointment'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(15),
              height:100,
              child:TextFormFieldCustom(
                textController: controller.dateinput,
                suffixIcon: Icon(Icons.calendar_today,color: ColorManager.grey,),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: controller.selectedDate ?? DateTime.now(),
                    firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: ColorManager.primary, // <-- SEE HERE
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: ColorManager.primary,
                              textStyle: TextStyle(fontSize: 16,fontFamily: "lato",fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if(pickedDate != null ){
                    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);

                    // controller.tabIndex = 0.obs;
                    //formatted date output using intl package =>  2021-03-16
                    // controller.changeTabIndex(0);
                    controller.isDisplaytab.value = true;
                    controller.selectedDate = pickedDate;
                    controller.dateinput.text = formattedDate; //set output date to TextField value.
                  }else{
                    print("Date is not selected");
                  }
                },
              )
          ),

          Obx(
                () => BottomNavigationBar(
                  elevation: 0.0,
                  currentIndex: controller.tabIndex.value,
                  onTap: controller.changeTabIndex,
                  selectedItemColor: ColorManager.primary, // Set the selected tab color
                  unselectedItemColor: ColorManager.primary,
                  selectedFontSize: 18,
                  unselectedFontSize: 16,

                  selectedLabelStyle: TextStyle(
                    fontFamily: "lato",
                    fontWeight: FontWeight.w700,
                    fontSize: FontSize.s18
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontFamily: "lato",
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.s16
                  ),
                  items:  [
                    BottomNavigationBarItem(icon: Icon(null), label: 'Morning',backgroundColor: ColorManager.primary),
                    BottomNavigationBarItem(icon: Icon(null), label: 'Afternoon',backgroundColor: ColorManager.primary),
                    BottomNavigationBarItem(icon: Icon(null), label: 'Evening',backgroundColor: ColorManager.primary),
              ],
            ),
          ),
          Expanded(
            child: Obx(()=>PageView(
              controller: controller.pageController,

              onPageChanged: (index) {
                controller.tabIndex.value = index;
              },
              children: [
                controller.isDisplaytab.value? GridView.builder(
                    padding: EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100,
                        childAspectRatio: 4 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: controller.morningtimeslots.value.length,
                    itemBuilder: (BuildContext ctx, index) {
                      bool isEnabled = controller.isTimeSlotEnabled(controller.morningtimeslots.value[index]);
                      return  InkWell(
                        onTap: isEnabled? (){
                          print("isEnabled = ${isEnabled}");

                          controller.setSelectedMorningIndex(index);

                        }:null,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                              border: Border.all(color: isEnabled? controller.isSelectedindexMorning.value == index? Colors.blueAccent:Colors.amber:Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(controller.morningtimeslots.value[index]),
                        ),);
                    }):Container(),

                controller.isDisplaytab.value?GridView.builder(
                    padding: EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100,
                        childAspectRatio: 4 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: controller.afternoontimeslots.value.length,
                    itemBuilder: (BuildContext ctx, index) {
                      bool isPickedDateToday = DateFormat('yyyy-MM-dd').format(controller.selectedDate!) ==
                          DateFormat('yyyy-MM-dd').format(DateTime.now());
                      bool isEnabled = controller.isTimeSlotEnabled(controller.afternoontimeslots.value[index]);
                      return InkWell(
                        onTap:isEnabled? (){

                          controller.setSelectedAfternoonIndex(index);

                          print("isEnabled = ${isEnabled}");
                        }:null,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                              border: Border.all(color: isEnabled? controller.isSelectedindexAfternoon.value == index? Colors.blueAccent:Colors.amber:Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(controller.afternoontimeslots.value[index]),
                        ),
                      );
                    }):Container(),
                controller.isDisplaytab.value? GridView.builder(
                    padding: EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100,
                        childAspectRatio: 4 / 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: controller.eveningtimeslots.value.length,
                    itemBuilder: (BuildContext ctx, index) {
                      bool isEnabled = controller.isTimeSlotEnabled(controller.eveningtimeslots.value[index]);
                      return InkWell(
                        onTap:isEnabled? (){
                          print("isEnabled = ${isEnabled}");

                          controller.setSelectedEveningIndex(index);

                        }:null,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: isEnabled?controller.isSelectedindexEvening.value == index? Colors.blueAccent:Colors.amber:Colors.grey),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(controller.eveningtimeslots.value[index]),
                        ),
                      );
                    }):Container(),
              ],
            ))
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 56,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Row(
          children: <Widget>[

            Expanded(
              child: InkWell(
                onTap: ()async{

                  // var fcmToken = await FirebaseMessaging.instance.getToken();
                  // print("fcmtoken = ${fcmToken}");
                },
                child: Container(
                  alignment: Alignment.center,
                  color: ColorManager.primary,
                  child: CustomText(text: "Book Slot",color: ColorManager.white,fontSize: 16,fontWeight: FontWeight.w500,),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
