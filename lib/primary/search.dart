import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import '../secondary/healthcare_catdetals.dart';
import '../secondary/naturalcare_detail.dart';
import 'home.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Category> categories = [
    Category(image: "assests/image/img_4.png", label: "Health care"),
    Category(image: "assests/image/img_3.png", label: "Natural care"),

  ];
  final Map<String, WidgetBuilder> categoryPages = {
    'Health care': (context) => HealthDetail(),
    'Natural care': (context) => NaturalDetail(),
  };

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
                : SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredCategories.length,
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
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
          ],
        ),
      ),
    );
  }
}
