import 'package:b2bapp/primary/cart.dart';
import 'package:b2bapp/primary/home.dart';
import 'package:b2bapp/primary/profile.dart';
import 'package:b2bapp/primary/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  List<Widget> pages = [];

  Future<void> _openWhatsApp() async {
    final Uri whatsappUri = Uri.parse("https://wa.me/9846465390");
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  @override
  void initState() {
    super.initState();
    pages = [
      Home(),
      Search(),
      Cart(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
        child: GNav(
          rippleColor: Colors.transparent,
          hoverColor: Colors.transparent,
          haptic: true,
          tabBorderRadius: 30.r, // Scaled value
          tabActiveBorder: Border.all(color: Colors.transparent),
          tabBorder: Border.all(color: Colors.transparent),
          tabShadow: [],
          curve: Curves.easeOutExpo,
          duration: Duration(milliseconds: 100),
          gap: 8.w, // Use ScreenUtil scaling
          color: Colors.grey[800],
          activeColor: Color(0xff005511),
          iconSize: 24.sp,
          tabBackgroundColor: Color(0xff6EBC31).withOpacity(0.42),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
          selectedIndex: currentIndex,
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search_outlined,
              text: 'Search',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            elevation: 0,
            onPressed: _openWhatsApp,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.asset(
                'assests/image/img.png',
                fit: BoxFit.fill,
                width: 50.0,
                height: 50.0,
              ),
            ),
            heroTag: "whatsappBtn",
          ),
        ],
      ),
    );
  }
}
