import 'package:b2bapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

class Invoicepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:white,
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Sample Invoice",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),),
        centerTitle: true,
        backgroundColor:white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Summary Section
              buildOrderSummary(),
              SizedBox(height: 16),

              // Delivery Invoice Section
              buildDeliveryInvoice(),
              SizedBox(height: 16),

              // Tax Invoice Section
              buildTaxInvoice(),
              SizedBox(height: 16),

              // Footer Message Section
              buildFooterMessage(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderSummary() {
    return Card(
      child: Container(
        width: double.infinity, // Adjust width as needed
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order summary',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.expand_more, color:black),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: maintheme1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.local_shipping, color:white),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery in',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:black,
                      ),
                    ),
                    Text(
                      'estimated in 2-3 days',
                      style: TextStyle(fontSize: 11, color:grey),
                    ),
                  ],
                ),
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:lighttheme42,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Action for change button
                  },
                  child: Text(
                    'change',
                    style: TextStyle(color: Darktheme1),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
      
            // Shipping and Recipient Information
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color:grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Shipping Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping name',
                        style: TextStyle(fontSize: 10, color:grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Leafbazar',
                        style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'From',
                        style: TextStyle(fontSize: 12, color:grey),
                      ),
                      Text(
                        'Leafbazar Enterprises Pvt.Ltd \nPuthanangadi ROAD, \nMEKKAD P.O',
                        style: TextStyle(fontSize: 11, color:black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Quantity',
                        style: TextStyle(fontSize: 12, color:grey),
                      ),
                      Text(
                        '12+1 (Free)',
                        style: TextStyle(fontSize: 12, color:black),
                      ),
                    ],
                  ),
      
                  // Recipient Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recipient name',
                        style: TextStyle(fontSize: 10, color:grey),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Alangad Medicals',
                        style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'To',
                        style: TextStyle(fontSize: 12, color:grey),
                      ),
                      Text(
                        'Sadhujana Sangam \nBuilding,Alangad P.O,\nAluva',
                        style: TextStyle(fontSize: 12, color: black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Amount',
                        style: TextStyle(fontSize: 12, color:grey),
                      ),
                      Text(
                        '960rs',
                        style: TextStyle(fontSize: 12, color:black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDeliveryInvoice() {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Delivery Invoice",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {},
                  ),
                ],
              ),
              Divider(),
              Table(
                columnWidths: {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                  5: FlexColumnWidth(2),
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Item Name",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Quantity",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Unit",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Price/Unit",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "GST",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Amount",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      "Bashpika tulasi",
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      "12 + 1 (Free)",
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      "Bottle",
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      "71.43 Rs",
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      "102.86 (12%)",
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      "960 Rs",
                      style: TextStyle(fontSize: 11),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTaxInvoice() {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tax Invoice", style: TextStyle(fontWeight: FontWeight.bold)),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub total"),
                Text("857.14 Rs"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("SGST @6%"),
                Text("51.43 Rs"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("CGST @6%"),
                Text("51.43 Rs"),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total"),
                Text("960.00 Rs"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFooterMessage(BuildContext context) {
    return Customfootermesg();
  }
}

class Customfootermesg extends StatelessWidget {
  const Customfootermesg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 360, // Set your desired width
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Green Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  color: maintheme1,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet,
                        color: Colors.white, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'your account has been credited with 10 leaf coins',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
        
              // Message
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Thank you for Doing Business with us !',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: maintheme1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: Text(
                        'back to home',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
