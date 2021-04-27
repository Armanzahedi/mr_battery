import 'package:flutter/material.dart';
import 'package:mr_battery/models/product.dart';
import 'package:mr_battery/widgets/home_screen/product_card.dart';

class ProductsGrid extends StatelessWidget {
  var product = new Product("test", "test", "test");
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: 90),
      crossAxisCount: 2,
      children: List.generate(
        10,
        (index) {
          return Center(
            child: ProductCard(product: product),
          );
        },
      ),
    );
  }
}
