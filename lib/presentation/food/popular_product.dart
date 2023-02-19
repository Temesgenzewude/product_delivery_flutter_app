import 'package:flutter/material.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Delivery",
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Popular Product Page",
          ),
        ),
      ),
    );
  }
}
