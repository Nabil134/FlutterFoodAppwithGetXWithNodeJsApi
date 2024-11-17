import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/product.dart';

class product_image extends StatelessWidget {
  const product_image({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Center(child: Hero(
      tag: product.id,
      child: Image.network(product.image,height: Get.height*0.4,width: Get.width*0.4,),),);
  }
}
