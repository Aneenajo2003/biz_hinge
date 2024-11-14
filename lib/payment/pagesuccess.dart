import 'package:b2bapp/primary/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../main.dart'; // Import Google Fonts

class User {
  final String shippingName;
  final String recipientName;
  final String fromAddress;
  final String toAddress;
  final int quantity;
  final double amount;

  User({
    required this.shippingName,
    required this.recipientName,
    required this.fromAddress,
    required this.toAddress,
    required this.quantity,
    required this.amount,
  });
}

class OrderConfirmationScreen extends StatefulWidget {
  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _imageSize = 300;
  double _opacity = 0.0;
  late String orderId;

  final User user = User(
    shippingName: "Leafbazar\nEnterprises Pvt. Ltd",
    recipientName: "Alangad Medicals",
    fromAddress: "Leafbazar\nEnterprises Pvt. Ltd\nPuthanangadi ROAD,\nMEKKAD P.O",
    toAddress: "Sadhujuna Sangam\nBuilding,\nAlangad P.O, Aluva",
    quantity: 12,
    amount: 960.0,
  );

  @override
  void initState() {
    super.initState();
    var uuid = Uuid();
    orderId = uuid.v4().substring(0, 8); // Shortened Order ID

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {
        _imageSize = 150;
        _opacity = 1.0;
      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: AnimatedSize(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'assests/image/img_11.png',
                  width: _imageSize,
                  height: _imageSize,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your order has been made!",
              style: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Congratulations, your order has been\nsuccessfully placed! We will pick up your order as\nsoon as possible.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  height: 41,
                  width: 44,
                  decoration: BoxDecoration(
                    color: Color(0xff6EBC31),
                    border: Border.all(
                      color: Colors.transparent, // Border color
                      width: 1, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8), // Optional: rounded corners
                  ),
                  child: Icon(Icons.directions_bus_outlined,
                  color: Color(0xff1D1B20).withOpacity(0.46),),
                ),

                SizedBox(width: 15,),
                Text(
                  "Order ID: #$orderId", // Shortened Order ID
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrderInfoColumn(
                          title: "Shipping name",
                          details: user.shippingName,
                        ),
                        OrderInfoColumn(
                          title: "Recipient name",
                          details: user.recipientName,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrderInfoColumn(
                          title: "From",
                          details: user.fromAddress,
                        ),
                        OrderInfoColumn(
                          title: "To",
                          details: user.toAddress,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Quantity",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${user.quantity}+(1 Free)",
                              style: GoogleFonts.poppins(fontSize: 12,
                                fontWeight: FontWeight.w400,),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Amount",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${user.amount}rs",
                              style: GoogleFonts.poppins(fontSize: 12,
                                fontWeight: FontWeight.w400,),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(
              height: 27,
              width: 244,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6EBC31).withOpacity(0.50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15), // Responsive border radius
                  ),
                ),
                child: Text(
                  "Show purchase invoice",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff005511),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 27,
              width: 244,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6EBC31),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15), // Responsive border radius
                  ),
                ),
                child: Text(
                  "Back to home",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class OrderInfoColumn extends StatelessWidget {
  final String title;
  final String details;

  OrderInfoColumn({required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        Text(
          details,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
