import 'package:flutter/material.dart';

import '../../../../models/product.dart';

class product_description extends StatelessWidget {
   product_description({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Text(product.description,style:Theme.of(context).textTheme.bodyLarge!.copyWith(
      color:Theme.of(context).colorScheme.primary, // Corrected text style
    ),
    );
  }
}

