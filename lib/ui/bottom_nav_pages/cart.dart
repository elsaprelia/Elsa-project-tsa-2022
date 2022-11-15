import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/ui/bottom_nav_pages/favourite.dart';
import 'package:flutter_ecommerce/ui/pay.dart';
import 'package:flutter_ecommerce/widgets/fetchProducts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: InkWell(
        onTap: () =>
            Navigator.push(context, CupertinoPageRoute(builder: (_) => Pay())),
        child: fetchData("users-cart-items"),
      )),
    );
  }
}
