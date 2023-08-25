import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/rounded_loading_button.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'assets/images/feedback.png', // Replace with your image asset path
                  height: 180,
                  width: Get.mediaQuery.size.width/1.2,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(),
              CustomText(text: 'Feedback',
                fontSize: FontSize.s18,
                maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,color: ColorManager.black,),
              CustomText(text: 'Your feedback is important for us',
                fontSize: FontSize.s14,
                maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.normal,color: ColorManager.black,),
              SizedBox(height: 10,),
              CustomText(text: 'Rate your experience',
                fontSize: FontSize.s18,
                maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,color: ColorManager.black,),
              RatingBar.builder(

                initialRating: 0, // Initial rating value
                minRating: 1, // Minimum rating
                direction: Axis.horizontal, // Rating direction (horizontal or vertical)
                allowHalfRating: true, // Allow selecting half ratings
                itemCount: 5, // Number of rating items
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0), // Padding between rating items
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // This callback is triggered when the user updates the rating
                  print(rating);
                  // You can update the state or perform any action with the selected rating
                },
              ),
              SizedBox(height: 10,),
              Divider(color: ColorManager.primary,),
              CustomText(text: 'Anything else you want to add',
                fontSize: FontSize.s14,
                maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.normal,color: ColorManager.black,),
              TextFormFieldCustom(
                textController: controller.firstNameController,
                hintText: "Tell us more about your overall experience",
                keyboardType: TextInputType.emailAddress,
                maxLines: 4,
                // validator: (value) => value!.validateEmail(),
              ),
              SizedBox(height: 30,),
              Container(
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
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
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: CustomText(text: "SEND FEEDBACK",color: ColorManager.white,fontSize: 16,fontWeight: FontWeight.w500,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // AssetImage("assets/icons/feedback.png")
            ],
          ),
        ),
      )
    );
  }
}
