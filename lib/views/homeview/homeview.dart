import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/cart%20controller/cart_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/category_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/fav_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/views/homeview/Product%20Detail/product_detail.dart';
import 'package:get/get.dart';

import 'Product Detail/cart_list.dart';
import 'package:badges/badges.dart' as badges;

import 'Product Detail/fav_list.dart';

class HomeView extends StatelessWidget {
   HomeView({super.key});
   CategoryController categoryController = Get.find();
   CartController cartController = Get.find();
   FavController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode(),);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home page',style: TextStyle(
            color: Colors.teal,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
actions: [
  InkWell(
    onTap: (){
      Get.to(CartList(),);
    },
    child: Padding(
      padding:  EdgeInsets.only(left: 14,right: 14,
        top: 14,
      ),
      child: badges.Badge(
        badgeContent: Obx(() => Text(cartController.cartItems.length.toString(),),),
        child: SvgPicture.asset('assets/svg/cart.svg',color: Colors.teal,) ,
      ),
    ),
  ),
  InkWell(
    onTap: (){
      Get.to(FavouriteList(),);
    },
    child: Padding(
      padding:  EdgeInsets.only(left: 14,right: 14,
        top: 14,
      ),
      child: badges.Badge(
        badgeContent: Obx(() => Text(favController.favItems.length.toString(),),),
        child: SvgPicture.asset('assets/svg/heart.svg',color: Colors.teal,) ,
      ),
    ),
  ),
],
        ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            /*first portion start here*/
            TextFormField(
              controller: categoryController.searchController,
              onChanged: (value)=>categoryController.filterProduct(value),
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            /*first portion end here*/
              const SizedBox(height: 25,),
            /*second portion start here*/
            Text(
              'Category',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color, // Corrected text style
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

            /*second portion end here*/
              const SizedBox(height: 25,),
              /*third portion start here*/

              SizedBox(height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index){
                  return Obx(() =>
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: (){
                          categoryController.updateCategoryIndex(index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          constraints: BoxConstraints(
                            maxWidth: 165, // Minimum width for each container
                          ),
                          decoration: BoxDecoration(
                            color: categoryController.categoryIndex.value==index?Colors.teal:Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            Image.asset(categoryController.categories[index]['image']!,height: 40,width: 40,),
                            SizedBox(width: 8),
                            Text(categoryController.categories[index]['title']!,textAlign: TextAlign.center,style: TextStyle(fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: categoryController.categoryIndex.value==index?Colors.white:Colors.grey,
                            ),),

                          ],),
                        ),

                      ),
                  );
                }, separatorBuilder: (context,index){
                  return SizedBox(width: 18,);

                }, itemCount: 3),
              ),
            /*third portion end here*/
              const SizedBox(height: 30,),
              /*last portion start here*/
Obx(() => SizedBox(
  height: Get.height*0.4,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
    var currentProduct=categoryController.products[index];
    return InkWell(
      onTap: (){
        categoryController.resetSearchText();
        Get.to(ProductDetail(product: currentProduct),);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: index==0?0:8,vertical: 8),
        child:ConstrainedBox(
          constraints: BoxConstraints(
           minWidth: Get.width * 0.1, // Minimum width
            maxWidth: Get.width * 0.6, // Maximum width
           minHeight: Get.height * 0.35, // Minimum height
           maxHeight: Get.height * 0.35, // Maximum height
          ),
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.teal,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag:currentProduct.id,
                    child: Image.network(currentProduct.image,height: Get.height*0.15,),),
                ),
                const SizedBox(height: 5,),
                Text(currentProduct.name,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),),

                Text(currentProduct.description,style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color, // Corrected text style

                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price",style: TextStyle(color: Colors.teal),),

                    SizedBox(width: Get.width*0.08,),
                    Text('\$${currentProduct.price.toString()}',style:
                    TextStyle( fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,),),
                  ],),



              ],),
          ),
        ),
      ),
    );

  }, separatorBuilder: (context,index){

    return SizedBox(width: 10,);
  }, itemCount: categoryController.products.length),
),),

              /*last portion end here*/
          ],),
        ),
      ),
      ),
    );
  }
}
