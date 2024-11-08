import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import 'home.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Category> categories = [
    Category(image: "assests/image/img_1.png", label: "Thailam"),
    Category(image: "assests/image/img_1.png", label: "Body Lotion"),
    Category(image: "assests/image/img_1.png", label: "Face Wash"),
    Category(image: "assests/image/img_1.png", label: "Shampoo"),
    Category(image: "assests/image/img_1.png", label: "Conditioner"),
    Category(image: "assests/image/img_1.png", label: "Soap"),

  ];

  List<Category> filteredCategories = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCategories = categories;

    _searchController.addListener(_filterCategories);
  }

  void _filterCategories() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      filteredCategories = categories.where((category) {
        return category.label.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCategories);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Color(0xff005511),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
            color: Color(0xff2C2D2E),
            fontWeight: FontWeight.bold,
            fontFamily: "Sen",
            fontSize: 20,
            letterSpacing: 2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xff005511),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            filteredCategories = categories;
                          });
                        },
                        icon: const Icon(
                          Icons.highlight_remove_rounded,
                          color: Color(0xff005511),
                        ),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontFamily: "Sen",
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            filteredCategories.isEmpty
                ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'No results found',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
                : SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryDetails(
                            category: filteredCategories[index],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 65.w,
                            height: 90.h,
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
                            child: Center(
                              child: Container(
                                width: 60.w,
                                height: 60.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        filteredCategories[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            filteredCategories[index].label,
                            style: GoogleFonts.poppins(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
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
      ),
    );
  }
}
