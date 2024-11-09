import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff005511),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff677294).withOpacity(0.80),
                            ),
                            child: IconButton(onPressed: (){}, icon: Icon(
                              Icons.camera_alt,
                              color: Color(0xff005511),
                            ),)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text(
                  "Personal information",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0xff005511),
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                      // controller: _nameController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Contact number",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0xff005511),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                      // controller: _nameController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        suffixIcon: Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Shop Name",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Color(0xff005511),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                      // controller: _nameController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Location",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xff005511),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                      // controller: _nameController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        suffixIcon: Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff6EBC31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Responsive border radius
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}