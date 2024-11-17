import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';

class CartController extends GetxController{
  var cartItems=<ProductModel>[].obs;
  /*addItemInCart start here*/
  void addItemInCart(ProductModel product){
    if(cartItems.contains(product)){
      Get.snackbar("Error", "${product.name} is already in the cart",backgroundColor:Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.contentTextStyle?.color ?? Colors.black,
        snackPosition: Get.theme.snackBarTheme.behavior == SnackBarBehavior.floating
            ? SnackPosition.BOTTOM
            : SnackPosition.TOP,
      );
    }
    else{
      cartItems.add(product);
      Get.snackbar("Success", "${product.name} Successfully added to this Cart ",
        backgroundColor:Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.contentTextStyle?.color ?? Colors.black,
        snackPosition: Get.theme.snackBarTheme.behavior == SnackBarBehavior.floating
            ? SnackPosition.TOP
            : SnackPosition.BOTTOM,
      );
    }

  }
/*addItemInCart end here*/
  /*increaseQuantity start here*/
  void increaseQuantity(ProductModel product){
    product.quantity++;
  }
/*increaseQuantity end here*/
  /*decreaseQuantity start here*/
  void decreaseQuantity(ProductModel product){
    if(product.quantity>1) {
      product.quantity--;
    }
  }
/*decreaseQuantity end here*/
/*removeItemFromCart start here*/
  void removeItemFromCart(ProductModel product) {
    if (cartItems.contains(product)){
      cartItems.remove(product);
    }
    else{
      Get.snackbar(
        "Error",
        "${product.name} is not in the cart",
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.contentTextStyle?.color ?? Colors.black,
        snackPosition: Get.theme.snackBarTheme.behavior == SnackBarBehavior.floating
            ? SnackPosition.BOTTOM
            : SnackPosition.TOP,
      );
    }

  }
/*removeItemFromCart end here*/
/*calculateSubTotal start here*/
  double calculateSubTotal(){
    return cartItems.fold(0.0, (subTotal, data) => subTotal + data.price * data.quantity.value);
  }
/*calculateSubTotal end here*/
/*calculateDeliveryTotal start here*/
  double calculateDeliveryTotal(){
    if (cartItems.isEmpty) {
      return 0.0;
    }
    else{
      return 3;
    }
  }

/*calculateDeliveryTotal end here*/
/*calculateTotal start here*/
  double calculateTotal(){
    return calculateDeliveryTotal() + calculateSubTotal();
  }


/*calculateTotal end here*/
}