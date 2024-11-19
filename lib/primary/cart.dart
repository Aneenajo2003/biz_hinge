import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cards/cart/cartview.dart';
import '../cards/cart/cartitem.dart';
import '../common/app_colors.dart';
import '../main.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<int> productPrices = [120, 110, 110, 230, 120];
  final List<int> productQuantities = [12, 12, 12, 12, 12];

  int calculateSubtotal() {
    int subtotal = 0;
    for (int i = 0; i < productPrices.length; i++) {
      subtotal += productPrices[i] * productQuantities[i];
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    int subtotal = calculateSubtotal();

    return Scaffold(
      backgroundColor:white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
        ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  MyHomePage()),
            );
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productPrices.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  price: productPrices[index],
                  quantity: productQuantities[index],
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      productQuantities[index] = newQuantity;
                    });
                  },
                  onRemove: () {
                    setState(() {
                      productPrices.removeAt(index);
                      productQuantities.removeAt(index);
                    });
                  },
                );
              },
            ),
            Divider(),
            Cartview(subtotal: subtotal),  // Pass subtotal to Cartview
          ],
        ),
      ),
    );
  }
}
