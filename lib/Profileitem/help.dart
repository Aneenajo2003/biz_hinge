import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/app_colors.dart';

class HelpCenterPage extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Help Center',
          style: GoogleFonts.poppins(

              fontWeight: FontWeight.w500),
        ),
        backgroundColor:Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildHeaderSection(),

              SizedBox(height: 24),


              _buildContactOptionsSection(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildHeaderSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.red,
        gradient: LinearGradient(
          colors: [lighttheme84, maintheme1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(Icons.headset_mic, size: 60, color: Colors.white),
          SizedBox(height: 10),
          Text(
            'We\'d Love to Hear From You!',
            style: GoogleFonts.poppins(  // Using Poppins font
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Please contact us with your queries or feedback, and we\'ll get back to you as soon as possible.',
            style: GoogleFonts.poppins(  // Using Poppins font
              fontSize: 16,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Contact Us Options Section
  Widget _buildContactOptionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: lighttheme84,
          ),
        ),
        SizedBox(height: 24),

        // WhatsApp option
        _contactOption(
          Icons.messenger_outlined,
          'Contact on WhatsApp',
          'https://wa.me/7510530121', // Replace with your WhatsApp number
          'Chat with us on WhatsApp',
        ),

        // Email option
        _contactOption(
          Icons.email,
          'Email Us',
          'mailto:aneenaj25@gmail.com', // Replace with your support email
          'Send an email to support',
        ),

        // Phone Call option
        _contactOption(
          Icons.phone,
          'Call Us',
          'tel:+91 7510530121', // Replace with your phone number
          'Call our support line',
        ),
      ],
    );
  }

  // Helper Widget to create Contact Option Row
  Widget _contactOption(IconData icon, String title, String url, String description) {
    return Card(color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: lighttheme84),
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        subtitle: Text(
          description,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
        ),
        onTap: () => _launchURL(url),
      ),
    );
  }
}
