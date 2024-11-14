import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  // final bool isBold;

  const SummaryRow({
    required this.label,
    required this.value,
    // this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label, style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),
            // style: isBold
            //     ? const TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.white)
            //     : null,
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
            // style: isBold
            //     ? TextStyle(fontWeight: FontWeight.bold,color: Colors.white)
            //     : null,
          ),
        ],
      ),
    );
  }
}