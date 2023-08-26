
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital_managment_system/app/data/model/appointment_model.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/user_repository.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:intl/intl.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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
  RxList<AppointmentModel> appointmentList = <AppointmentModel>[].obs;
  final UserRepository _userRepository = UserRepository();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final Map<String, dynamic> arguments = Get.arguments;
    userModel.value = arguments['userData'];
    createbookTimeSlot();
    // getAllBookedAppointment();
  }
  getAllBookedAppointment(String date,String time,String id)async{
    try{
      Map<String,dynamic> params = {
        "doctor_id": id,
        "appointment_date":date,
        "appointment_time":time
      };
      print("params = ${params}");
      String url = UrlManager.GET_APPOITNMENT_DOCTOR;

      var response = await _userRepository.getAllAppointmentByDoctot(params,url);
      print("response on end= ${response.toString()}");

      if(response['status'] == "true"){
        return true;
      }else{
        print("in else");
        Get.snackbar(
          'Error',
          response['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
        return false;
      }

    } catch (error) {


      Get.snackbar(
        'Error',
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 3),
      );
      return false;
    }
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
      print("isPickedDateToday  if");
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
  final StorageManager _storage = StorageManager();
  UserModel userForModel =UserModel();
  Rx<String> finaltime = "".obs;
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
        finaltime.value =selectedTime;
        print("selectedTime = ${selectedTime}");
        print("selectedDate = ${selectedDate}");
        print("doctor id = ${userModel.value.userId}");
        print("doctor id = ${userModel.value.charge}");
        var amouunt = int.parse(userModel.value.charge!) * 100;
        final StorageManager _storage = StorageManager();
        userForModel =(await _storage.retrieveModelUser('userData'))!;
        print("login user = ${userForModel.userId}");
        Rx<bool> isSlotBooked = false.obs;
       var valueget =  await getAllBookedAppointment(selectedDate.toString(),selectedTime,userModel.value.userId.toString());
        print(valueget);
        if(valueget){
          Razorpay razorpay = Razorpay();
          var options = {
            'key': 'rzp_test_9NU52T9fMX4V1k',
            'amount': amouunt,
            'name': 'Pluse Care Hospital',
            'description': 'Appointment',
            'retry': {'enabled': true, 'max_count': 1},
            'send_sms_hash': true,
            'prefill': {'contact': '${userModel.value.mobileNo}', 'email': '${userModel.value.email}'},
            'external': {
              'wallets': ['paytm']
            }
          };
          razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
          razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
          razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
          razorpay.open(options);
        }
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
  checkBookedSlot()async{
    // for(int i =0;i<appointmentList.value.length;i++)
    //   {
    //     print("appsdfkjsdf");
    //   }

  }
  void handlePaymentErrorResponse(PaymentFailureResponse response){
    Get.snackbar(
      'Error',
      "Payment Failed",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: EdgeInsets.all(20),
      duration: Duration(seconds: 3),
    );
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    // showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response)async{
    var finalresponse = response;

    final StorageManager _storage = StorageManager();
    userForModel =(await _storage.retrieveModelUser('userData'))!;
    print("login user = ${userForModel.userId}");
    var myTimeStamp = DateTime.now().millisecondsSinceEpoch;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(userForModel.userId.toString())
        .collection("Chats")
        .doc(userModel.value.userId.toString())
        .set({
      "name": userModel.value.firstname,
      "is_block":false,
      "is_block_by_user":false,
      "time_stamp": myTimeStamp,
    }).whenComplete(() async{
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userModel.value.userId.toString())
          .collection("Chats")
          .doc(userForModel.userId.toString())
          .set({
        "name": userForModel.firstname,
        "is_block":false,
        "is_block_by_user":false,
        "time_stamp": myTimeStamp,
      });
    });

    try{
      var apptime =finaltime.value.toString();
      var appdate =selectedDate.toString();
      var doctorID =userModel.value.userId!.toString();
      var patientID =userForModel.userId!.toString();
      var payementid = finalresponse.paymentId.toString();

      Map<String,dynamic> params = {
        "doctor_id": doctorID,
        "patient_id":patientID,
        "appointment_date":appdate,
        "appointment_time":apptime.toString(),
        "payment_id":payementid,
      };
      print("params = ${params}");
      String url = UrlManager.ADD_APPOITNMENT;

      var response = await _userRepository.addAppointment(params,url);
      print("response on end= ${response.toString()}");

      if(response['status'] == "true"){

        Get.snackbar(
          'Success',
          "Payment Success",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorManager.primary,
          colorText: Colors.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
        Get.offAllNamed('/home');
        // Get.offAndToNamed('/home');
      }else{
        print("in else");
        Get.snackbar(
          'Error',
          response['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
      }

    } catch (error) {
      print("Error: $error");

      Get.snackbar(
        'Error',
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 3),
      );
    }
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    // showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response){
    // showAlertDialog(context, "External Wallet Selected", "${response.walletName}");
  }

}
