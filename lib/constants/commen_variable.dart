import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalVariables {
  static SizedBox swidth = const SizedBox(
    width: 5,
  );
  static SizedBox sheight = const SizedBox(
    height: 5,
  );
  static SizedBox mwidth = const SizedBox(
    width: 10,
  );
  static SizedBox mheight = const SizedBox(
    height: 10,
  );
  static SizedBox bwidth = const SizedBox(
    width: 15,
  );
  static SizedBox bheight = const SizedBox(
    height: 15,
  );
  static SizedBox lwidth = const SizedBox(
    width: 20,
  );
  static SizedBox lheight = const SizedBox(
    height: 20,
  );
  static SizedBox xwidth = const SizedBox(
    width: 30,
  );
  static SizedBox xheight = const SizedBox(
    height: 30,
  );

  static Color backgroundColor = const Color(0xffffffff);

  static const appBarGradient = LinearGradient(
    colors: [
      Color(0xff839ff2),
      Color(0xff839ff2),
      Color(0xff839ff2),
      Color(0xffa2b6f2),
      Color(0xffa2b6f2),
    ],
  );
  static var selectedNavBarColor = const Color(0xff839ff2);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    "assets/assets/slider1.jpg",
    "assets/assets/slider2.jpeg",
    "assets/assets/slider3.jpg",
    "assets/assets/slider5.jpg",
    "assets/assets/slider6.jpg",
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/assets/mobileblue.jpg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/assets/essentialswhite.jpg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/assets/appliancerose.jpg',
    },
    {
      'title': 'Books',
      'image': 'assets/assets/bookswhite.jpg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/assets/fashionred.jpg',
    },
  ];
}