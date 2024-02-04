import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import 'package:logger/logger.dart';
import 'package:martfy/constants/commen_variable.dart';
import 'package:martfy/helper/localDB.dart';
import 'package:martfy/helper/noetwork_repo.dart';
import 'package:martfy/models/user_model.dart';

import '../../../models/product_model.dart';

class HomeVM extends ChangeNotifier {
  final ApiProvider apiProvider = ApiProvider();

  LocalDatabaseService db = LocalDatabaseService();
  final Logger _logger = Logger();
  User user = User();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isProduct = false;
  bool get isProduct => _isProduct;
  List<Product> productList = [];

  List<Product> productListAll = [];
  List<Product> cartsList = [];

  Product product = Product();

  HomeVM() {
    getProfile();
    getAllProductsAll();
    getCarts();
  }

  Future<void> getAllProducts({required String category}) async {
    try {
      _isProduct = true;
      final response = await apiProvider.getList('products?category=$category');
      productList = List<Product>.from(
          response.map((productMap) => Product.fromJson(productMap)));
      _logger.d('Products: $productList');
    } catch (error, stackTrace) {
      _logger.e("Error getting products: $error",
          error: error, stackTrace: stackTrace);
    } finally {
      _isProduct = false;
      notifyListeners();
    }
  }

  Future<void> getAllProductsAll() async {
    try {
      _isProduct = true;
      final response = await apiProvider.getList('products/all');
      productListAll = List<Product>.from(
          response.map((productMap) => Product.fromJson(productMap)));
      _logger.d('Products: $productListAll');
    } catch (error, stackTrace) {
      _logger.e("Error getting products: $error",
          error: error, stackTrace: stackTrace);
    } finally {
      _isProduct = false;
      notifyListeners();
    }
  }

  Future<void> getProfile() async {
    try {
      _isLoading = true;
      final response = await apiProvider.get('profile');
      user = User.fromJson(response);
      _logger.d('Profile: $user');
    } catch (error, stackTrace) {
      _logger.e("Error getting profile: $error",
          error: error, stackTrace: stackTrace);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _currentPassword = '';
  String _newPassword = '';
  String get currentPassword => _currentPassword;

  set currentPassword(String value) {
    _currentPassword = value;
    notifyListeners();
  }

  // Getter and setter for newPassword
  String get newPassword => _newPassword;

  set newPassword(String value) {
    _newPassword = value;
    notifyListeners();
  }

  Future<void> changePassword(void Function(bool success) callback) async {
    bool success = false;
    try {
      final Map<String, dynamic> passwordData = {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      };
      printx("this current password", currentPassword);
      printx("this new password", newPassword);
      await apiProvider.put('change-password', passwordData);
      printx("password", passwordData);
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  Future<void> updateProfile(void Function(bool success) callback) async {
    bool success = false;
    try {
      user = user.copyWith(name: user.name, email: user.email);
      await apiProvider.put('profile', user.toJson());
      printx("password", user.toJson());
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  Future<void> addToCart(
      void Function(bool success) callback, Product product) async {
    bool success = false;
    try {
      product = product.copyWith(id: product.id);
      final res =
          await apiProvider.postToken('add-to-cart', {'id': product.id});
      final cart = res['cart'];
      printx("add to cart---------------------", product.toJson());
      success = true;
      notifyListeners();
      return cart;
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  Future<void> getCarts() async {
    try {
      _isProduct = true;
      final response = await apiProvider.getList('get-cart');
      cartsList = List<Product>.from(response
          .map((productMap) => Product.fromJson(productMap['product'])));
      _logger.d('Products: $cartsList');
    } catch (error, stackTrace) {
      _logger.e("Error getting products: $error",
          error: error, stackTrace: stackTrace);
    } finally {
      _isProduct = false;
      notifyListeners();
    }
  }

  String category = 'Mobiles';
  Future<void> addProduct(
      {required Function(bool success) callback,
      required List<File> imagess}) async {
    bool success = false;
    try {
      // Create a list of base64-encoded image data
      List<String> imageBase64List = [];
      for (int i = 0; i < images.length; i++) {
        List<int> imageBytes = await images[i].readAsBytes();
        String base64Image = base64Encode(imageBytes);
        imageBase64List.add(base64Image);
      }

      product = product.copyWith(
          name: product.name,
          category: category,
          description: product.description,
          images: imageBase64List,
          price: product.price,
          quantity: product.quantity);
      await apiProvider.postAdmin('admin/add-product', product.toJson());

      printx("add to cart", product.toJson());
      success = true;
      notifyListeners();
    } catch (error, stackTrace) {
      _logger.e("Error: $error", error: error, stackTrace: stackTrace);
    } finally {
      callback(success);
      _logger.d("Response: $success");
    }
  }

  List<File> images = [];
  Future<List<File>> pickImages() async {
    try {
      var files = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (files != null && files.files.isNotEmpty) {
        for (int i = 0; i < files.files.length; i++) {
          File originalImage = File(files.files[i].path!);

          // Compress the image
          File compressedImage = await compressImage(originalImage);

          images.add(compressedImage);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return images;
  }

  Future<File> compressImage(File originalImage) async {
    // Define your preferred maximum file size in kilobytes (KB)
    int maxSizeKB = 200;

    // Read the image as bytes
    List<int> imageBytes = await originalImage.readAsBytes();

    // Convert List<int> to Uint8List
    Uint8List uint8List = Uint8List.fromList(imageBytes);

    // Compress the image
    List<int> compressedBytes = await FlutterImageCompress.compressWithList(
      uint8List,
      minWidth: 800, // Adjust the dimensions based on your needs
      minHeight: 600,
      quality: 70,
      rotate: 0,
    );

    // Check if the compressed image size is within the desired limit
    while (compressedBytes.length / 1024 > maxSizeKB) {
      // If the size exceeds the limit, compress further with lower quality
      compressedBytes = await FlutterImageCompress.compressWithList(
        uint8List,
        minHeight: 1920,
        minWidth: 1080,
        quality: 50, // Adjust the quality value
        rotate: 0,
      );
    }

    // Save the compressed image to a new file
    File compressedImage = File('${originalImage.path}_compressed.jpg');
    await compressedImage.writeAsBytes(compressedBytes);

    return compressedImage;
  }
}
