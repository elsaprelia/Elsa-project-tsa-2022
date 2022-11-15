import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/const/AppColors.dart';
import 'package:flutter_ecommerce/ui/admin_nav_controller.dart';
import 'package:flutter_ecommerce/ui/bottom_nav_controller.dart';
import 'package:flutter_ecommerce/widgets/customButton.dart';
import 'package:flutter_ecommerce/widgets/myTextField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productImgController = TextEditingController();
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("products");
    return _collectionRef
        .doc(currentUser!.email)
        .set({
          "description": _productDescriptionController.text,
          "image": _productImgController.text,
          "name": _productNameController.text,
          "price": _productPriceController.text,
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AdminNavController())))
        .catchError((error) => print("something is wrong. $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Submit new product",
                  style:
                      TextStyle(fontSize: 22.sp, color: AppColors.deep_orange),
                ),
                Text(
                  "Klik save to continue",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFFBBBBBB),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                myTextField("enter description", TextInputType.text,
                    _productDescriptionController),
                myTextField("enter link image", TextInputType.text,
                    _productImgController),
                myTextField(
                    "enter name", TextInputType.text, _productNameController),
                myTextField(
                    "enter price", TextInputType.text, _productPriceController),

                SizedBox(
                  height: 50.h,
                ),

                // elevated button
                customButton("Save", () => sendUserDataToDB()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
