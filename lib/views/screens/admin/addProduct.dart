import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/views/screens/auth/authVM.dart';
import 'package:martfy/views/screens/auth/login_screen.dart';
import 'package:martfy/views/screens/home/home_vm.dart';
import 'package:martfy/views/widgets/custom_button.dart';
import 'package:martfy/views/widgets/custom_textield.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  HomeVM vm = HomeVM();
  void selectImages() async {
    var res = await vm.pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Provider.of<AuthVM>(context, listen: false).logoutUser();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                  value: vm.product.name ?? '',
                  hintText: 'name...',
                  prefixIcon: const Icon(Icons.production_quantity_limits),
                  focusNode: FocusNode(),
                  onChange: (value) {
                    vm.product = vm.product.copyWith(name: value);
                  },
                ),

                const SizedBox(height: 10),
                CustomTextField(
                  value: vm.product.description ?? '',
                  hintText: 'description...',
                  prefixIcon: const Icon(Icons.design_services),
                  focusNode: FocusNode(),
                  onChange: (value) {
                    vm.product = vm.product.copyWith(description: value);
                  },
                ),
                // CustomTextField(
                //   controller: descriptionController,
                //   hintText: 'Description',
                //   maxLines: 7,
                // ),
                const SizedBox(height: 10),
                CustomTextField(
                  value: vm.product.price.toString(),
                  hintText: 'price...',
                  prefixIcon: const Icon(Icons.price_change),
                  focusNode: FocusNode(),
                  onChange: (value) {
                    vm.product =
                        vm.product.copyWith(price: double.tryParse(value));
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  value: vm.product.quantity.toString(),
                  hintText: 'Quantity...',
                  prefixIcon: const Icon(Icons.production_quantity_limits),
                  focusNode: FocusNode(),
                  onChange: (value) {
                    vm.product =
                        vm.product.copyWith(quantity: double.tryParse(value));
                  },
                ),

                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: vm.category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      vm.category = newVal!;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  color: Colors.blue,
                  onClick: () {
                    vm.addProduct(
                        callback: (success) {
                          if (success) {
                            xmToast('Successfully product', Colors.green);
                          } else {
                            xmToast('Login product', Colors.red);
                          }
                        },
                        imagess: vm.images);
                  },
                  name: 'Sell',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
