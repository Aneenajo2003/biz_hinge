import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../secondary/profile_edit.dart';


class Item {
  final String name;
  final IconData icon;
  // final Widget destination;

  Item({required this.name, required this.icon,
    // required this.destination
  });
}


class Profile extends StatelessWidget {
  Profile({super.key});

  final List<Item> items = [
    Item(
      name: "Orders",
      icon: Icons.shopping_cart_sharp,
      // destination: OrdersPage(),
    ),
    Item(
      name: "Login Settings",
      icon: Icons.login,
      // destination: LoginSettingsPage(),
    ),
    Item(
      name: "Delete Account",
      icon: Icons.restore_from_trash,
      // destination: DeleteAccountPage(),
    ),
    Item(
      name: "Payment Settings",
      icon: Icons.attach_money_rounded,
      // destination: PaymentSettingsPage(),
    ),
    Item(
      name: "Support Center",
      icon: Icons.handshake_rounded,
      // destination: SupportCenterPage(),
    ),
    Item(
      name: "Privacy and Security",
      icon: Icons.security_outlined,
      // destination: PrivacySecurityPage(),
    ),
    Item(
      name: "Help Center",
      icon: Icons.help,
      // destination: HelpCenterPage(),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
          Icon(Icons.arrow_back, size: 24),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 160),
                        child: Column(crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                            Text(
                              'shop',
                              style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            Text(
                              'Owner name',
                              style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ), IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditProfile()),
                          );
                        },
                        icon:
                        Icon(Icons.edit_calendar_outlined, size: 15),
                      ),

                    ],
                  ),
                ),

              ),
              SizedBox(height: 10,),
              Container(
                height: 500,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(6.0),
                      child: ListTile(
                        leading: Icon(
                          items[index].icon,
                          color: const Color(0xff6EBC31),
                          size: 24,
                        ),
                        title: Text(
                          items[index].name,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => items[index].destination,
                          //   ),
                          // );
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
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
                    "LOG OUT",
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