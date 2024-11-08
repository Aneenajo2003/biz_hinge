import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category Page 1")),
      body: Center(child: Text("This is Category Page 1")),
    );
  }
}

class CategoryPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Category Page 2")),
      body: Center(child: Text("This is Category Page 2")),
    );
  }
}

// Define other pages similarly...
