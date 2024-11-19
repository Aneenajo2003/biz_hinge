import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

class HealthDetail extends StatelessWidget {
  final List<Productdet> products = [
    Productdet(
        name: "Bashpika Tulasi",
        volume: "7ml",
        price: "77rs",
        imageUrl: "assests/image/img_6.png",
        stock: 15),
    Productdet(
        name: "Bashpika Tulasi",
        volume: "10ml",
        price: "120rs",
        imageUrl: "assests/image/img_6.png",
        stock: 30),
    Productdet(
        name: "Sukh Bodycare Oil",
        volume: "100ml",
        price: "50rs",
        imageUrl: "assests/image/img_8.png",
        stock: 20),
    Productdet(
        name: "Sukh Bodycare Oil",
        volume: "100ml",
        price: "120rs",
        imageUrl: "assests/image/img_8.png",
        stock: 8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Category Name",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: black,
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

class ProductCard extends StatelessWidget {
  final Productdet product;

  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 115,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        child: Image.asset(
                          product.imageUrl,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.volume,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: black,
                          ),
                        ),
                        SizedBox(height: 4),
                        if (product.stock <= 10)
                          Text(
                            "No Stock",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: red,
                            ),
                          ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (product.stock > 10)
                              ElevatedButton(
                                onPressed: () {
                                  // Implement your Buy Now logic
                                  print("Buy Now clicked for ${product.name}");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: maintheme1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "Buy Now",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    product.price,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: black,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class Productdet {
  final String name;
  final String volume;
  final String price;
  final String imageUrl;
  final int stock;

  Productdet({
    required this.name,
    required this.volume,
    required this.price,
    required this.imageUrl,
    required this.stock,
  });
}
