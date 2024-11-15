import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../primary/profile.dart';
import 'kyc_verification.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _HomeState();
}

class _HomeState extends State<Signup> {
  TextEditingController namectrlr = TextEditingController();
  TextEditingController ownamectrlr = TextEditingController();
  TextEditingController phonectrlr = TextEditingController();
  TextEditingController reffcontroller = TextEditingController();

  final PageController pageController = PageController();

  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 350),
                      child: Container(
                        child: IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Login()),
                          );
                        }, icon: Icon(Icons.arrow_back_ios)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 10),
                      child: Text(
                        'Join us to start searching',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Sign up to explore and buy authentic',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Ayurvedic medicines !',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: namectrlr,
                          decoration: InputDecoration(
                            hintText: 'Shopname',
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(Icons.maps_home_work_sharp),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.length == 0) {
                              return "Name is empty";
                            }
                            if (value.contains("@")) {
                              return "it is not a valid name";
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: ownamectrlr,
                          decoration: InputDecoration(
                            hintText: 'Ownername',
                            hintStyle:  GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Name cannot be empty";
                            }
                            if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                              return "Name can only contain letters and spaces";
                            }
                            if (value.trim().length < 3) {
                              return "Name must be at least 3 characters long";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: phonectrlr,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            hintStyle:  GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Phone number cannot be empty";
                            }
                            if (!RegExp(r"^\d+$").hasMatch(value)) {
                              return "Phone number must contain only digits";
                            }
                            if (value.length != 10) {
                              return "Phone number must be 10 digits long";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: reffcontroller,
                          decoration: InputDecoration(
                            hintText: 'Referral(Optional)',
                            hintStyle:  GoogleFonts.montserrat(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(Icons.wallet_giftcard_rounded),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: FormField<bool>(
                        initialValue: isChecked,
                        validator: (value) {
                          if (!isChecked) {
                            return "You must accept the terms and conditions.";
                          }
                          return null;
                        },
                        builder: (formFieldState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isChecked = !isChecked;
                                        formFieldState.didChange(isChecked);
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color:
                                          isChecked ?  Color(0xff6EBC31) :  Color(0xff6EBC31),
                                          width: 2,
                                        ),
                                        color: isChecked
                                            ?  Color(0xff6EBC31)
                                            : Colors.transparent,
                                      ),
                                      child: isChecked
                                          ? Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 14,
                                      )
                                          : null,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'I agree with the terms of Service & Privacy Policy',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (formFieldState.hasError)
                                Padding(
                                  padding: const EdgeInsets.only(left: 30, top: 5),
                                  child: Text(
                                    formFieldState.errorText!,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 15,),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  KycVerificationPage()),
                          );

                          if (_formKey.currentState?.validate() == true) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('sign-in  successful!')),
                            );
                          }

                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            elevation: 6,
                            backgroundColor: Color(0xff6EBC31),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left: 85),
                      child: Row(
                        children: [
                          Text(
                            'Already have an account ?',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff6EBC31),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Text(
                                ' Connect us',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff6EBC31),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Login()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            )));
  }
}