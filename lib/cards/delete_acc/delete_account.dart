import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import 'confirm_del.dart';

import 'deleteclz.dart';

class Deleteee extends StatefulWidget {
  const Deleteee({super.key});

  @override
  State<Deleteee> createState() => _DeleteeeState();
}

bool agreeToTerms = false;
bool noGiftCardBalance = false;
bool noPastServices = false;
final TextEditingController feedbackController = TextEditingController();

class _DeleteeeState extends State<Deleteee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: red,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color:black), onPressed: () {
            Navigator.pop(context);
        },

        ),
        title: Text(
          "Delete Account",
          style: TextStyle(fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color:black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              DeleteAccount.terms,
              style: TextStyle(fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color:black,
              ),
            ),
            CheckboxListTile(
              value: agreeToTerms,
              onChanged: (value) {
                setState(() {
                  agreeToTerms = value!;
                });
              },
              title: Text(
                "I have read and agreed to the Terms and Conditions.",
                style: TextStyle(fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color:black,
                ),
              ),
            ),
            CheckboxListTile(
              value: noGiftCardBalance,
              onChanged: (value) {
                setState(() {
                  noGiftCardBalance = value!;
                });
              },
              title:  Text(
                "I acknowledge that I do not have any Gift Card or SuperCoin balance in my account, or I am willing to forfeit them.",
                style: TextStyle(fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color:black,
                ),
              ),
            ),
            CheckboxListTile(
              value: noPastServices,
              onChanged: (value) {
                setState(() {
                  noPastServices = value!;
                });
              },
              title: Text(
                "I acknowledge that I will not be able to return/replace or seek any service regarding past orders.",
                style: TextStyle(fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color:black,
                ),
              ),
            ),
            const SizedBox(height: 20),
             Text(
              "Please tell us why you're leaving us:",
              style: TextStyle(fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color:black,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                border: OutlineInputBorder( borderSide:  BorderSide(color: Colors.teal)),
                hintText: "Your feedback will help us to improve .",
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (agreeToTerms && noGiftCardBalance && noPastServices) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Request submitted."),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please complete all agreements."),
                      ),
                    );
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeleteAccountPage()),
                  );
                },
                child:  Text("Continue",style: TextStyle(fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: white,
                ),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),

                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}