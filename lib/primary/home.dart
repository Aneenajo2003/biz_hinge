import 'package:b2bapp/primary/cart.dart';
import 'package:b2bapp/primary/profile.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Profileitem/notification.dart';
import '../common/app_colors.dart';
import '../secondary/healthcare_catdetals.dart';
import '../secondary/naturalcare_detail.dart';
import 'leafcoin.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Future<String> fetchUserName() async {
    // Simulate an API call
    await Future.delayed(Duration(seconds: 2));
    return "Shopname";
  }

  final List<String> banners = [
    "assests/image/img_5.png",
    "assests/image/img_5.png",
  ];

  final List<Category> categories = [
    Category(image: "assests/image/img_4.png", label: "Health care"),
    Category(image: "assests/image/img_3.png", label: "Natural care"),
  ];

  final List<Product> products = List.generate(
    4,
        (index) {
      switch (index) {
        case 0:
          return Product(
            name: "Bashpika\nTulasi",
            price: "₹100",
            image: "assests/image/img_6.png",
          );
        case 1:
          return Product(
            name: "Bashpika\nThulasi (7ml)",
            price: "₹120",
            image: "assests/image/img_7.png",
          );
        case 2:
          return Product(
            name: "Sukh\nBodycare Oil",
            price: "₹150",
            image: "assests/image/img_8.png",
          );
        case 3:
          return Product(
            name: "Sukh\nBodycare Oil",
            price: "₹110",
            image: "assests/image/img_9.png",
          );
        default:
          return Product(
            name: "Unknown Product",
            price: "₹0",
            image: "assests/image/default.png",
          );
      }
    },
  );

  final Map<String, WidgetBuilder> categoryPages = {
    'Health care': (context) => HealthDetail(),
    'Natural care': (context) => NaturalDetail(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:white,
      appBar: AppBar(
        backgroundColor:white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assests/image/img_2.png"),
              radius: 25,
            ),
          ),
        ),
        title: FutureBuilder<String>(
          future: fetchUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(
                ".....",
                style: GoogleFonts.kaushanScript(
                  fontSize: 25,
                  color: maintheme1,
                  fontWeight: FontWeight.bold,
                ),
              );
            } else if (snapshot.hasError) {
              return Text(
                "!!!!!!",
                style: GoogleFonts.oldStandardTt(
                  fontSize: 25,
                  color:red,
                  fontWeight: FontWeight.bold,
                ),
              );
            } else {
              final userName = snapshot.data ?? "Guest";
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi $userName",
                    style: GoogleFonts.kaushanScript(
                      fontSize: 20,
                      color: maintheme1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: GoogleFonts.paprika(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color:black,
                    ),
                  ),

                ],
              );
            }
          },
        ),
        actions: [
          IconButton(

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuperCoinStatement()),
              );
            },
            icon: Badge(
              backgroundColor:  Darktheme1,

            child: Icon(Icons.account_balance_wallet_outlined,
                color: Darktheme1),)
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
            icon: Badge(
              backgroundColor:  Darktheme1,
            child: Icon(Icons.notifications_none_outlined,
                color: Darktheme1),)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: banners.length,
                itemBuilder: (context, index, _) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(banners[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 162,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Categories",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color:black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final categoryLabel = categories[index].label;
                          final pageBuilder = categoryPages[categoryLabel];

                          if (pageBuilder != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: pageBuilder),
                            );
                          } else {
                            // Handle case where the page is not found
                            print("Page not found for category: $categoryLabel");
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color:white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color:white,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Image.asset(
                                        categories[index].image,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      categories[index].label,
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color:black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Best Selling...",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color:black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: 350,
                  child: GridView.builder(

                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // Set the maximum width here
                      mainAxisExtent: 148,
                      crossAxisSpacing: 50,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Card(
                            elevation:2,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:black,
                                  width: 0.1,
                                ),
                                color:white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 1),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            products[index].name,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color:black,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            products[index].price,
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color:black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      width: 60,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(products[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 20,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Color(0xff333333),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CartPage()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )


                        ],
                      );
                    },
                  ),
                ),
              ),// Rest of your body content
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final String image;
  final String label;

  Category({required this.image, required this.label});
}

class Product {
  final String name;
  final String price;
  final String image;

  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}
