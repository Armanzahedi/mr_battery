import 'package:flutter/material.dart';
import 'package:mr_battery/widgets/home_screen/products_grid.dart';
import 'package:mr_battery/widgets/home_screen/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      child: ProductsGrid(),
    );
  }
}
