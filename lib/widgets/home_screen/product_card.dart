import 'package:flutter/material.dart';
import 'package:mr_battery/models/product.dart';
import 'package:mr_battery/services/utils/my_theme.dart';

class ProductCard extends StatelessWidget {
  ProductCard({product});
  @required
  Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/product.png",
          ),
          Text(
            "باتری اتمی 75 آمپر واریان صبا باتری",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: MyTheme.secondaryColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  "20000 تومان",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
