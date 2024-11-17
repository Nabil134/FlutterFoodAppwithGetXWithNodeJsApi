import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../controllers/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  OnBoardingController onBoardingController = Get.find();


  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    var height = Get.height;
    return Scaffold(
      body: SafeArea(child:       Center(
        child: Container(
          height: height*0.95,
          width: width*0.95,
          margin: EdgeInsets.all(8),
          color:Colors.teal,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20,
                horizontal: 10
            ),
            child: Column(children: [
              /*first portion start here*/
              Expanded(
                child: PageView.builder(
                    onPageChanged: (page){
                      onBoardingController.setCurrentPage(page);
                    },
                    itemCount: onBoardingController.onboardingList.length,
                    itemBuilder:(context,index){
                      var items = onBoardingController.onboardingList[index];
                      return Column(children: [
                        Container(
                          alignment: Alignment.topRight,
                          height: height*0.22,
                          width: width*1,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(items['image']!),),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: TextButton(onPressed: (){
                              onBoardingController.goToHomePage();
                            },child: Text('Skip',style: TextStyle(color: Colors.white),),),
                          ),
                        ),
                        Text(items['title'].toString(),style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                        Text(
                          textAlign:TextAlign.center,
                          items['description'].toString(),style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                      ],);
                    }),
              ),
              /*first portion end here*/
              /*second portion start here*/
              SizedBox(
                height: 10,
                child:
                GetBuilder<OnBoardingController>(builder: (_){
                  return     ListView.builder(
                      itemCount:onBoardingController.onboardingList.length,
                      scrollDirection:Axis.horizontal,

                      itemBuilder: (context,index){
                        return Container(
                          height: 5,
                          width: onBoardingController.currentPage.value==index?25:10,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          color: onBoardingController.currentPage.value==index?Colors.red:Colors.white,
                        );
                      });
                }),

              ),
              /*second portion end here*/
              /*third portion start here*/
              Obx(() =>
              onBoardingController.currentPage.value==2?
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: (){
                      onBoardingController.goToHomePage();

                    }, child: Icon(Icons.arrow_forward_ios,color: Colors.black,),),
                ],
              ):Container(),
              ),
              /*third portion end here*/
            ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
