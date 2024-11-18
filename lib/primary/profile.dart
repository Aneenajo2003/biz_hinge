
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Profileitem/help.dart';
import '../Profileitem/notisetting.dart';
import '../Profileitem/order.dart';
import '../Profileitem/privacy.dart';
import '../Profileitem/terms&condition.dart';
import '../cards/delete_acc/delete_account.dart';

import '../common/app_colors.dart';
import '../front/login.dart';

import '../secondary/profile_edit.dart';

class Item {
  final String name;
  final IconData icon;
  final Widget destination;

  Item({
    required this.name,
    required this.icon,
    required this.destination,
  });
}

class Profile extends StatelessWidget {
  Profile({super.key});

  final List<Item> items = [
    Item(
      name: "Account Settings",
      icon: Icons.settings,
      destination: EditProfile(),
    ),
    Item(
      name: "Orders",
      icon: Icons.shopping_cart_sharp,
      destination: OrderDetailScreen(),
    ),

    Item(
      name: "Notification Settings",
      icon: Icons.notifications,
      destination: NotificationSettingsScreen(),
    ),

    Item(
      name: "Terms and Conditions",
      icon: Icons.handshake_rounded,
      destination: TermsPage(),
    ),
    Item(
      name: "Privacy and Security",
      icon: Icons.security_outlined,
      destination: Privacy(),
    ),
    Item(
      name: "Help and Support Center",
      icon: Icons.help,
      destination: HelpCenterPage(),
    ),
    Item(
      name: "Delete Account",
      icon: Icons.delete_forever,
      destination: Deleteee(),
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
          icon: Icon(Icons.arrow_back, size: 24, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.black,
                      child: Icon(Icons.maps_home_work_sharp, color: Colors.white, size: 30),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 160),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shop',
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyLarge,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Owner name',
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EditProfile()),
                        );
                      },
                      icon: Icon(Icons.edit_calendar_outlined,
                          size: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ListTile(
                      leading: Icon(
                        items[index].icon,
                        color: maintheme1,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => items[index].destination,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maintheme1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}