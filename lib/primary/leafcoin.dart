import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

class SuperCoinStatement extends StatelessWidget {
  const SuperCoinStatement({Key? key}) : super(key: key);
  String getExpirationText(DateTime expiryDate) {
    final currentDate = DateTime.now();
    final difference = expiryDate.difference(currentDate).inDays;

    if (difference > 0) {
      return "Expires in $difference days";
    } else if (difference == 0) {
      return "Expires today";
    } else {
      return "Expired ${difference.abs()} days ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {
        "title": "Expire Coins",
        "subtitle": "Debited on 03 Jul 2024",
        "amount": "-10",
        "amountColor": Colors.red,
      },
      {
        "title": "Expire Coins",
        "subtitle": "Debited on 02 Jun 2024",
        "amount": "-04",
        "amountColor": Colors.red,
      },
      {
        "title": "Carmesi Sweet Summer Natural UnderArms Deodorant",
        "subtitle": "Credited on 20 May 2024 | ${getExpirationText(DateTime(2024, 6, 30))}",
        "amount": "+02",
        "amountColor": Colors.green,
      },
      {
        "title": "KOTTY Regular Women Light Blue Jeans",
        "subtitle": "Credited on 18 Dec 2023 | ${getExpirationText(DateTime(2024, 6, 30))}",
        "amount": "+08",
        "amountColor": Colors.green,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Darktheme1,
        title: Text(
          "Leaf Coin Statement",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Darktheme1,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.monetization_on_rounded,
                          color: Colors.yellow, size: 30),
                      const SizedBox(width: 8),
                      Text(
                        "02",
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Available Balance",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.warning_rounded,
                            color: Colors.red, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          "2 leaf coins due to expire in 17 days",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Darktheme1,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Use LeafCoins",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(height: 32, thickness: 1, color: Colors.black12),
            // Transactions List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return _buildTransactionItem(
                    title: transaction["title"] as String,
                    subtitle: transaction["subtitle"] as String,
                    amount: transaction["amount"] as String,
                    amountColor: transaction["amountColor"] as Color,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                amount,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: amountColor,
                ),
              ),
            ],
          ),
          const Divider(height: 16, thickness: 1, color: Colors.black12),
        ],
      ),
    );
  }
}