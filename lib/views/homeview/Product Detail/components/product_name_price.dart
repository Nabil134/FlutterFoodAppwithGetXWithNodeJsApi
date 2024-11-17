import 'package:flutter/material.dart';

import '../../../../models/product.dart';

class product_name_price extends StatelessWidget {
  product_name_price({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(product.name,style: TextStyle(color: Colors.teal, fontSize: 30,
            fontWeight: FontWeight.bold,),),
        ),
        Text('\$${product.price}',style: TextStyle(color: Colors.teal, fontSize: 30,
          fontWeight: FontWeight.bold,),),
      ],);
  }
}

