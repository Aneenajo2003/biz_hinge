import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';
import '../primary/cart.dart';
import '../primary/home.dart';

class ProductPage extends StatefulWidget {
  late final Product product;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedVolume = '100 ml';
  bool isFavorite = false;

  final productData = {
    '100 ml': {
      'image': 'assests/image/img_10.png',
      'price': '120rs',
      'description': "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown"

    },
    '200 ml': {
      'image': 'assests/image/img_9.png',
      'price': '200rs',
      'description': "printer took a galley of type and scrambled it to make a type specimen book. "
  "It has survived not only five centuries, but also the leap into electronic typesetting",
    },
  };

  final List<String> availableVolumes = ['100 ml', '200 ml'];

  void selectVolume(String volume) {
    setState(() {
      selectedVolume = volume;
    });
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentData = productData[selectedVolume]!;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor:white,
        appBar: AppBar(
          backgroundColor: white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               "Bashpika Tulasi",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color:black,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Image.asset(
                  currentData['image']!,
                  width: 335,
                  height: 289,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: availableVolumes.map((volume) {
                      return Padding(
                        padding: const EdgeInsets.only(left:10,right: 8.0),
                        child: GestureDetector(
                          onTap: () => selectVolume(volume),
                          child: Container(

                            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4), // Smaller padding
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:black,
                                width: 0.1,
                              ),
                              color: selectedVolume == volume
                                  ? maintheme1
                                  : lighttheme39,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              volume,
                              style: GoogleFonts.poppins(
                                fontSize: 12, // Smaller font size
                                fontWeight: FontWeight.w400,
                                color: selectedVolume == volume ?white : black,
                              ),
                            ),
                          ),
                        ),
                      );

                    }).toList(),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      currentData['price']!,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                currentData['description']!,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lighttheme79,
                  ),
                  child: Text(
                    'Add to cart',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
