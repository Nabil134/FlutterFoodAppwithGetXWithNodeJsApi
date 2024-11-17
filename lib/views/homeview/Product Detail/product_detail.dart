import 'package:flutter/material.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/cart%20controller/cart_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/fav_controller.dart';
import 'package:get/get.dart';

import '../../../models/product.dart';
import 'components/product_description.dart';
import 'components/product_image.dart';
import 'components/product_name_price.dart';

class ProductDetail extends StatelessWidget {

   final ProductModel product;
   ProductDetail({super.key,required this.product});
CartController cartController = Get.find();
FavController favController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.name,style: TextStyle(color: Colors.teal),),
        leading: IconButton(onPressed: (){
          Get.back();

        },
          icon: Icon(Icons.arrow_back_ios,color: Colors.teal,),
        ),
        actions: [
          Obx(() =>
              IconButton(onPressed: (){

                favController.addItemToFavorite(product);
              }, icon: Icon(favController.toggleFavorite(product)?Icons.favorite:Icons.favorite_border_outlined,
                color: favController.toggleFavorite(product)?Colors.red:Theme.of(context).primaryColor,),),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            /*first portion start here*/
            product_image(product: product),
            /*first portion start here*/
              const SizedBox(height: 40,),
              /*second portion start here*/
          product_name_price(product: product),
              /*second portion end here*/
              const SizedBox(height: 40,),
             /*third portion start here*/
          product_description(product: product),
              /*third portion end here*/
              const SizedBox(height: 80,),
              /*last portion start here*/
              ElevatedButton(
                style:ElevatedButton.styleFrom(
                  backgroundColor:Colors.teal,
                  minimumSize: Size(400,60),
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(20),
                  ),

                ),
                onPressed:(){
                  cartController.addItemInCart(product);
                },
                child:Text("Cart View",style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
              /*last portion end here*/
          ],),
        ),
      ),
    );
  }
}

