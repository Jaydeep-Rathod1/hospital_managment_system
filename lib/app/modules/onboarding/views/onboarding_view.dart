import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: _controller.onSkip(),
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.topRight,
                child: Text("Skip"),
              ),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                  controller: _controller.pageController,
                  onPageChanged: _controller.selectedPageIndex,
                  itemCount: _controller.onboardingPages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Stack(

                          children: [


                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    _controller.onboardingPages[index].imageEsset,
                                    height: Get.mediaQuery.size.height/3.02,
                                    width: Get.mediaQuery.size.width/1.44,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding:EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                    child: Text(
                                      _controller.onboardingPages[index].title,
                                      style: Get.theme.textTheme.titleMedium,

                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                      padding:EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                                      child: Text(
                                        _controller.onboardingPages[index].description,
                                        style: Get.theme.textTheme.labelSmall?.copyWith(
                                          color: ColorManager.darkGrey,
                                        ),
                                        textAlign: TextAlign.center,
                                      )),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ]
                      ),
                    );
                  }),
            ),
            Container(
              width: Get.mediaQuery.size.width,
              margin: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 80,
                      child: ListView.builder(
                        itemCount: _controller.onboardingPages.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(() => Container(
                            margin: const EdgeInsets.all(4),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: _controller.selectedPageIndex.value == index
                                  ? ColorManager.primary
                                  : ColorManager.primary.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                          ));
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 20), // Add some spacing between the ListView and the ElevatedButton
                  Container(
                    height: 42,
                    width: 150,
                    child: ElevatedButton(
                      child: Obx(() {
                        return Text(
                          _controller.isLastPage ? "Start" : "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: ColorManager.white,
                          ),
                        );
                      }),
                      onPressed: _controller.nextAction,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
