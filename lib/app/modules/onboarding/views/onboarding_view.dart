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
                        alignment: Alignment.topRight,
                        child: Text("Skip"),
                      ),

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
                                  style: Get.theme.textTheme.labelSmall,
                                  textAlign: TextAlign.center,
                                )),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,

                          child: Row(
                        children: [
                              ListView.builder(
                                itemCount: _controller.onboardingPages.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Obx(() {
                                    return Container(
                                      margin: const EdgeInsets.all(4),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        // color: _controller.selectedPageIndex.value == index
                                        //     ? "#0B0E43".toColor()
                                        //     : "#C9CCD2".toColor(),
                                        shape: BoxShape.circle,
                                      ),
                                    );
                                  });
                                },
                              )
                        ],
                      )),
                      /*Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 60,
                          // child: Row(
                          //   children: [
                          //     ListView.builder(
                          //       itemCount: _controller.onboardingPages.length,
                          //       scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context, index) {
                          //         return Obx(() {
                          //           return Container(
                          //             margin: const EdgeInsets.all(4),
                          //             width: 12,
                          //             height: 12,
                          //             decoration: BoxDecoration(
                          //               color: Colors.red,
                          //               // color: _controller.selectedPageIndex.value == index
                          //               //     ? "#0B0E43".toColor()
                          //               //     : "#C9CCD2".toColor(),
                          //               shape: BoxShape.circle,
                          //             ),
                          //           );
                          //         });
                          //       },
                          //     )
                          //   ],
                          // ),
                        ),
                      )*/
                      // Positioned(
                      //     bottom: 20,
                      //     left: 20,
                      //     child: Row(
                      //       children: List.generate(
                      //           _controller.onboardingPages.length,
                      //               (index) => Obx(() {
                      //             return Container(
                      //                 margin: const EdgeInsets.all(4),
                      //                 width: 12,
                      //                 height: 12,
                      //                 decoration: BoxDecoration(
                      //                     // color:
                      //                     // _controller.selectedPageIndex.value ==
                      //                     //     index
                      //                     //     ? "#0B0E43".toColor()
                      //                     //     : "#C9CCD2".toColor(),
                      //                     shape: BoxShape.circle));
                      //           })),
                      //     )),
                      // Positioned(
                      //     right: 20,
                      //     bottom: 20,
                      //     child: FloatingActionButton(
                      //       // backgroundColor: "#0B0E43".toColor(),
                      //       elevation: 0,
                      //       child: Obx(() {
                      //         return Text(
                      //           _controller.isLastPage ? "Start" : "Next",
                      //           style: const TextStyle(
                      //             fontWeight: FontWeight.w700,
                      //             fontFamily: "fallingskysebd",
                      //           ),
                      //         );
                      //       }),
                      //       onPressed: _controller.nextAction,
                      //     )),
                      // Positioned(
                      //     child: Obx(() => IconButton(
                      //       icon: !_controller.isFirstPage
                      //           ? Icon(Icons.arrow_back, )
                      //           : const SizedBox.shrink(),
                      //       onPressed: () => {_controller.skipAction()},
                      //     ))),

                    ]
                ),
              );
            }),
      ),
    );
  }
}
