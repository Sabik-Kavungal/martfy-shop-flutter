import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void xmToast(String message, Color backgroundColor) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: backgroundColor,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
  void printx(String format, dynamic argument) {
    print('$format $argument');
  }
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
static const List<Map<String, dynamic>> categoryImages = [
  {
    'title': 'Mobiles',
    'icon': Icons.mobile_friendly,
    'color':Colors.green
  },
  {
    'title': 'Essentials',
    'icon': Icons.shopping_bag,
      'color':Colors.blue
  },
  {
    'title': 'Appliances',
    'icon': Icons.kitchen,
      'color':Colors.brown
  },
  {
    'title': 'Books',
    'icon': Icons.book,
      'color':Colors.cyan
  },
  {
    'title': 'Fashion',
    'icon': Icons.accessibility,
      'color':Colors.blueGrey
  },
];

  // static const List<Map<String, String>> categoryImages = [
  //   {
  //     'title': 'Mobiles',
  //     'image': 'assets/images/mobiles.jpeg',
  //   },
  //   {
  //     'title': 'Essentials',
  //     'image': 'assets/images/essentials.jpeg',
  //   },
  //   {
  //     'title': 'Appliances',
  //     'image': 'assets/images/appliances.jpeg',
  //   },
  //   {
  //     'title': 'Books',
  //     'image': 'assets/images/books.jpeg',
  //   },
  //   {
  //     'title': 'Fashion',
  //     'image': 'assets/images/fashion.jpeg',
  //   },
  // ];
}
