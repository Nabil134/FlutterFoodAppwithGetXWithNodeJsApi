import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/fav_controller.dart';
import 'package:get/get.dart';

class FavouriteList extends StatelessWidget {
  FavController favController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen',style: TextStyle(
          color: Colors.teal,
        ),
        ),
        leading: IconButton(onPressed: (){
          Get.back();

        },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric (horizontal: 14,vertical: 14),
        child: Column(children: [
          /*first portion start here*/
          Obx(() =>
              SizedBox(
                height: Get.height*0.8,
                child: favController.favItems.isNotEmpty?
                Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            var favItem = favController.favItems[index];
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: Get.width * 0.1, // Minimum width
                                maxWidth: Get.width * 0.6, // Maximum width
                                minHeight: Get.height * 0.2, // Minimum height
                                maxHeight: Get.height * 0.2, // Maximum height
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
decoration: BoxDecoration(
  color: Colors.grey.shade100,
  borderRadius: BorderRadius.circular(10),
  border: Border.all(
    color: Colors.teal,
  ),
),
                                child: Row(children: [
                                  Container(
                                    height: Get.height * 0.13, // 13% of screen height
                                    width: Get.width * 0.25, // 25% of screen width
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.teal,
                                      ),
                                    ),
                                    child: Image(
                                      image: NetworkImage(favItem.image),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: Get.width * 0.05, top: Get.height * 0.02),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text(
                                          favItem.name,
                                          style: TextStyle(
                                            fontSize: Get.width * 0.05, // 5% of screen width
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        Text(
                                          favItem.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: Get.width * 0.04, // Adjust description font size based on screen width
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                      ],),
                                    ),
                                  ),
                                  IconButton(onPressed: (){
                                    favController.removeItemFromFavorite(favItem);
                                  }, icon: SvgPicture.asset('assets/svg/heart.svg',color: Colors.red,),
                                  )  ,
                                ],),

                              ),
                            );


                          }, separatorBuilder: (context,index){
                        return SizedBox(height: 10,);
                      }, itemCount:favController.favItems.length),
                    ),
                  ],

                ):Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn.pixabay.com/animation/2022/08/23/03/32/03-32-04-108_512.gif",
                        height: 230,
                      ),
                      Text('Your Favourite List Is Empty',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.teal,
                      ),),
                    ],),
                ),),
          ),
          /*first portion end here*/

        ],),
      ),
    );
  }
}
