import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Home extends StatelessWidget {
  Home({super.key});

  final List<String> banners = [
    "assests/image/img_5.png",
    "assests/image/img_5.png"
  ];

  final List<Category> categories = [
    Category(image: "assests/image/img_4.png", label: "Health care"),
    Category(image: "assests/image/img_3.png", label: "Natural care"),

  ];

  final List<Product> products = List.generate(
    10,
        (index) => index % 2 == 0
        ? Product(
      name: "Eucalyptus Oil(25ML)",
      price: "₹100",
      image: "assests/image/img_1.png",
    )
        : Product(
      name: "Bashpika Thulasi(7ml)",
      price: "₹120",
      image: "assests/image/img_1.png",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Color(0xff539DF3).withOpacity(0.1),
        leading: Padding(
          padding: EdgeInsets.all(8.h),
          child: Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  "assests/image/img_2.png"
                ),
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Shopname",
              style: GoogleFonts.kaushanScript(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.lightGreen,
              ),
            ),
            Text(
              "Welcome",
              style: GoogleFonts.paprika(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_balance_wallet_outlined, color: Color(0xff005511))),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none_outlined, color: Color(0xff005511))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            CarouselSlider.builder(
              itemCount: banners.length,
              itemBuilder: (context, index, _) {
                return SizedBox(
                  width: 338.w, // Set the width you want for each item
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(banners[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200.h, // Set the height you want for the carousel
                viewportFraction: 0.8,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
              ),
            ),

            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text(
                      "Top Categories",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              height: 140.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryDetails(category: categories[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 70.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
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
                                  width: 40.w,  // Adjust width to scale down the image
                                  height: 40.h, // Adjust height to scale down the image
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Image.asset(
                                    categories[index].image,
                                    fit: BoxFit.contain,  // Ensures the image fits within the box
                                  ),
                                ),
                                SizedBox(height: 10.h),  // Adjusted spacing
                                Text(
                                  categories[index].label,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10.sp,
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

          SizedBox(height: 15.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Best Selling...",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.88,
              height: 300.h,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120.h,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50.h,
                    width: 40.w,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 15.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index].name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    products[index].price,
                                    style: GoogleFonts.poppins(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(products[index].image),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ));


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

  Product({required this.name, required this.price, required this.image});
}

class CategoryDetails extends StatelessWidget {
  final Category category;

  const CategoryDetails({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.label),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(category.image, width: 100.w, height: 100.h),
            SizedBox(height: 20.h),
            Text(
              category.label,
              style: GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
