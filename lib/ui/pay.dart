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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "PEMBAYARAN",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text("LAKUKAN PEMBAYARAN VIA TRANSFER KE REKENING: "
            "BCA : 0875987698 "
            "A/N ELSA APRELIA "
            "KONFIRMASI KE ADMIN DENGAN WA KE NOMOR 085646485283 "
            "SERTAKAN BUKTI TRANSFER DAN ALAMAT PENGIRIMAN ATAU DIAMBIL KE OFFLINE STORE"),
      ),
    );
  }
}
