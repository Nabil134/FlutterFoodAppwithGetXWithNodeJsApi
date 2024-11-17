import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';

class FavController extends GetxController{
  var favItems=<ProductModel>[].obs;
  /*toggleFavorite start here*/
  bool toggleFavorite(ProductModel product){
    return favItems.contains(product);

  }
/*toggleFavorite end here*/
  /*addItemToFavorite start here*/
  void addItemToFavorite(ProductModel product){
    if(favItems.contains(product)){
      favItems.remove(product);
      Get.snackbar("Error", "${product.name} is already in the Favorite",backgroundColor:Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.contentTextStyle?.color ?? Colors.black,
        snackPosition: Get.theme.snackBarTheme.behavior == SnackBarBehavior.floating
            ? SnackPosition.BOTTOM
            : SnackPosition.TOP,
      );
    }
    else {
      favItems.add(product);
      Get.snackbar("Success", "${product.name} Successfully added to this Favorite ",
        backgroundColor:Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.contentTextStyle?.color ?? Colors.black,
        snackPosition: Get.theme.snackBarTheme.behavior == SnackBarBehavior.floating
            ? SnackPosition.TOP
            : SnackPosition.BOTTOM,
      );
    }
  }
/*addItemToFavorite end here*/
/*removeItemFromFavorite start here*/
  void removeItemFromFavorite(ProductModel product) {
    if (favItems.contains(product)){
      favItems.remove(product);
    }
    else{
      Get.snackbar(
        "Error",
        "${product.name} is not in the Favorite",
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
        colorText: Get.theme.snackBarTheme.contentTextStyle?.color ?? Colors.black,
        snackPosition: Get.theme.snackBarTheme.behavior == SnackBarBehavior.floating
            ? SnackPosition.BOTTOM
            : SnackPosition.TOP,
      );
    }

  }
/*removeItemFromFavorite end here*/
}