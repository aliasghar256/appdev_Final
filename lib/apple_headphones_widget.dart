import 'package:flutter/material.dart';

class AppleHeadphonesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'Recommended for your devices',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  'See All',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Headphones Image
                Image.asset(
                  'assets/images/apple_headphones.jpg', // Update with your image path
                  width: 150,
                ),
                SizedBox(height: 8),
                Text(
                  'Free Engraving',
                  style: TextStyle(color: Colors.orange, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  'AirPods Max — Silver',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  'A\$899.00',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: Colors.grey, radius: 6),
                    SizedBox(width: 6),
                    CircleAvatar(backgroundColor: Colors.black, radius: 6),
                    SizedBox(width: 6),
                    CircleAvatar(backgroundColor: Colors.red, radius: 6),
                    SizedBox(width: 6),
                    Text(
                      '+1 more',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}