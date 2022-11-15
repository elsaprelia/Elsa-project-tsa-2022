import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/fetchProducts.dart';

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: fetchData("users-favourite-items"),
      ),
    );
  }
}
