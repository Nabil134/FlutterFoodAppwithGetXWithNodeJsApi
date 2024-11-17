import 'package:flutter/material.dart';
import 'package:flutterfastfoodwithgetxusingapi/controllers/cart%20controller/cart_controller.dart';
import 'package:flutterfastfoodwithgetxusingapi/views/homeview/homeview.dart';
import 'package:get/get.dart';

class CartList extends StatelessWidget {
  CartList({super.key});

  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen',style: TextStyle(
          color: Colors.teal,
        ),
        ),
        leading: IconButton(onPressed: (){
          Get.back();

        },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Obx(() =>
              Text('Total ${cartController.cartItems.length.toString()} Items',),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 14),
          child: Column(children: [
            const SizedBox(height:10),
            /*first portion start here*/
            Obx(() =>
                SizedBox(
                  height: Get.height*0.8,
                  child: cartController.cartItems.isNotEmpty?
                Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            var cartItem = cartController.cartItems[index];
                            return ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: Get.width * 0.92, // Restrict container width to 92% of screen width
                                minWidth: Get.width * 0.92,
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.04, // 4% of screen width
                                  vertical: Get.height * 0.01,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.03, // 3% of screen width
                                  vertical: Get.height * 0.015, // 1.5% of screen height
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.teal,
                                  ),
                                ),
                                child: Row(
                                  children: [
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
                                        image: NetworkImage(cartItem.image),
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
                                              cartItem.name,
                                              style: TextStyle(
                                                fontSize: Get.width * 0.05, // 5% of screen width
                                                fontWeight: FontWeight.bold,
                                                color: Colors.teal,
                                              ),
                                            ),
                                            SizedBox(height: Get.height * 0.01), // Add space between name and description
                                            Text(
                                              cartItem.description,
                                              style: TextStyle(
                                                fontSize: Get.width * 0.04, // Adjust description font size based on screen width
                                                fontWeight: FontWeight.bold,
                                                color: Colors.teal,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: Get.height * 0.02), // Add space between description and quantity row
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    cartController.increaseQuantity(cartItem);
                                                  },
                                                  icon: Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                                Obx(() => Text(
                                                  cartItem.quantity.toString(),
                                                  style: TextStyle(color: Colors.teal),
                                                )),
                                                IconButton(
                                                  onPressed: () {
                                                    cartController.decreaseQuantity(cartItem);
                                                  },
                                                  icon: Icon(
                                                    Icons.remove_circle_outline,
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                                Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    cartController.removeItemFromCart(cartItem);
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );


                          }, separatorBuilder: (context,index){
                        return SizedBox(height: 10,);
                      }, itemCount:cartController.cartItems.length),
                    ),
                  ],

                ):Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif",
                        height: 230,
                      ),
                      Text('Your Cart Is Empty',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.teal,
                      ),),
                    ],),
                ),),
            ),
            /*first portion end here*/
            Divider(),
            /*second portion start here*/
            Column(children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey.shade100,
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('SubTotal',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.teal,
                        ),),
                        Obx(() =>  Text(cartController.calculateSubTotal().toString(),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.teal,
                        ),),
                        ),
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Charges',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.teal,
                        ),),
                        Obx(() =>
                            Text(cartController.calculateDeliveryTotal().toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.teal,
                            ),),
                        ),
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.teal,
                        ),),
                        Obx(() =>
                            Text(cartController.calculateTotal().toString(),style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.teal,
                            ),),
                        ),
                      ],),
                  ],),
              ),
            ],),
            /*second portion start here*/
            const SizedBox(height: 20,),
            /*last portion start here*/
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.teal,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: (){
                Get.to(HomeView(),);
              }, child: Text('Check Out',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),),),
            /*last portion end here*/
          ],),
        ),
      ),
    );
  }
}
