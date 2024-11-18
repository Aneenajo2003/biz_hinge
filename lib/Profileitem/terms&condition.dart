
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cards/profile/term_clz.dart';
import '../common/app_colors.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back )),
        title: Text('Terms and Conditions', style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: maintheme1,
        ),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          TermsAndConditions.terms,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),

      ),
    );
  }
}