import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../secondary/categorydetail.dart';

class Home extends StatelessWidget {
  Home({super.key});

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
            name: "Bashpika Tulasi",
            price: "₹100",
            image: "assests/image/img_6.png",
          );
        case 1:
          return Product(
            name: "Bashpika Thulasi (7ml)",
            price: "₹120",
            image: "assests/image/img_7.png",
          );
        case 2:
          return Product(
            name: "Sukh Bodycare Oil",
            price: "₹150",
            image: "assests/image/img_8.png",
          );
        case 3:
          return Product(
            name: "Sukh Bodycare Oil",
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
  // Mapping categories to their respective pages
  final Map<String, Widget Function(BuildContext)> categoryPages = {
    'Category1': (context) => CategoryPage1(),
    'Category2': (context) => CategoryPage2(),

  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assests/image/img_2.png"),
            radius: 25,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Shopname",
              style: GoogleFonts.kaushanScript(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.lightGreen,
              ),
            ),
            Text(
              "Welcome",
              style: GoogleFonts.paprika(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance_wallet_outlined,
                  color: Color(0xff005511))),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined,
                  color: Color(0xff005511))),
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
                    width: 380,
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
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Categories",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
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
                          // Handle case where the page is not found, if needed
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
                                color: Colors.white,
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
                                      color: Colors.white,
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
                                      color: Colors.black,
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
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
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
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.1,
                              ),
                              color: Colors.white,
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
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
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
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    width: 90,
                                    height: 120,
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
                          Positioned(
                            top: 92,
                            left: 8,
                            child: IconButton(

                              icon: Icon(Icons.add, size: 14),

                              onPressed: () {
                                // Add to cart action
                              },
                            ),
                          ),
                        ],
                      );
                    },
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
