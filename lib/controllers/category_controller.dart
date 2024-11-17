import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class CategoryController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  final TextEditingController searchController = TextEditingController();
  var searchText="".obs;
  var categoryIndex=0.obs;
  var products = <ProductModel>[].obs;
  var filterProducts = <ProductModel>[].obs;
  var isDataLoadingCompleted = false.obs;
  var categories =[
    {'image':'assets/images/burgerlogo.png','title':'Burger'},
    {'image': 'assets/images/icecream1.png', 'title': 'desserts'},
    {'image': 'assets/images/chinese.jpg', 'title': 'chinese'},
  ].obs;
  /*updateCategoryIndex start here*/
  void updateCategoryIndex(int index){
    categoryIndex.value=index;
    loadCategoryData(index);
  }
/*updateCategoryIndex end here*/
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: categories.length, vsync: this);
   loadCategoryData(categoryIndex.value);
    filterProduct(searchController.text);
    searchController.addListener(() {
      filterProduct(searchController.text);
    });
  }
  /*loadCategoryData start here*/
 void loadCategoryData(int index){
   String category;
   switch(index){
     case 0:
       category ="burgers";
       break;
     case 1:
       category = "desserts";
       break;
     case 2:
       category = "chinese";
       break;
     default:
       category='burgers';
   }
fetchData(category);
  }
  /*loadCategoryData end here*/
  /*fetchData start here*/
  Future<void> fetchData(String category) async {
try{
  final response = await http.get(Uri.parse("https://muhammad-usman08.github.io/Hackathon_Project_Backend/data/products_data.js"),);
  if(response.statusCode==200){
    var decodeData=jsonDecode(response.body);
  //  print(decodeData[1]);
    var categoryItems=decodeData.firstWhere(
        (element)=>element['category']==category,
      orElse: () => null,
    )?['items'];
    print(categoryItems);
    if(categoryItems!=null){
      filterProducts.value = List.from(categoryItems)
          .map((e) => ProductModel.fromMap(e))
          .toList();
      products.value = filterProducts.toList();
      isDataLoadingCompleted.value = true;
    }
    else{
      filterProducts.clear();
      products.clear();
    }
  }
  else{
    print("Failed to load data, Status Code: ${response.statusCode}");
    Get.snackbar('Error', 'Failed to load products.');
  }
}
catch(e){
  isDataLoadingCompleted.value =false;
}
  }

/*fetchData end here*/
  /*filterProduct start here*/
  void filterProduct(String value){
    searchText.value = value.toLowerCase();
    if(searchText.value.isEmpty) {
      products.value= filterProducts.toList();
    }
    else{
      products.value = filterProducts.where((product) =>
          product.name.toLowerCase().contains(searchText.value)).toList();
    }
  }
  /*filterProduct end here*/
  /*resetSearchText start here*/
  void resetSearchText() {
    searchText.value ='';
    searchController.clear();
    products.value=filterProducts.toList();

  }
/*resetSearchText end here*/
/*destroy start here*/
  void destroy() {
    products.value = [];
  }
/*destroy end here*/
}