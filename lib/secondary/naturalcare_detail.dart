import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'healthcare_catdetals.dart';

class NaturalDetail extends StatelessWidget {
  final List<Productdet> products = [
    Productdet(name: "Bashpika Tulasi", volume: "7ml", price: "77rs", imageUrl: "assests/image/img_6.png"),
    Productdet(name: "Bashpika Tulasi", volume: "10ml", price: "120rs", imageUrl: "assests/image/img_6.png"),
    Productdet(name: "Bashpika Tulasi", volume: "10ml", price: "120rs", imageUrl: "assests/image/img_6.png"),
    Productdet(name: "Sukh Bodycare Oil", volume: "100ml", price: "50rs", imageUrl: "assests/image/img_8.png"),
    Productdet(name: "Sukh Bodycare Oil", volume: "100ml", price: "120rs", imageUrl: "assests/image/img_8.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Natural Care",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}
