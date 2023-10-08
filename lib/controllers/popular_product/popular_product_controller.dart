import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/popular_product/popular_products_repo.dart';
import '../../models/cart/cart_model.dart';
import '../../models/product/products_model.dart';
import '../cart/cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];

  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cartController;

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  int _quantity = 0;

  int get quantity => _quantity;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      print("Successfully loaded products");

      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;

      update();
    } else {
      print("Error loading products");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar("Item Count", "You can't reduce any more !",
          backgroundColor: Color(0xFF262626), colorText: Colors.white);

      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }

      return 0;
    } else if (_inCartItems + quantity > 30) {
      Get.snackbar("Item Count", "You can't add any more !",
          backgroundColor: Color(0xFF262626), colorText: Colors.white);
      return 30;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel productModel, CartController cartController) {
    _quantity = 0;

    _inCartItems = 0;
    _cartController = cartController;
    var exists = false;
    exists = _cartController.existInCart(productModel);

    if (exists) {
      _inCartItems = _cartController.getQuantity(productModel);
    }

    // print("The quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cartController.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cartController.getQuantity(product);

    _cartController.cartItems.forEach((key, value) {});

    // print("The length of the cart is ${_cartController.cartItems.length} ");
    update();
  }

  int get totalItems {
    return _cartController.totalItems;
  }

  List<CartModel> get getItems {
    return _cartController.getItems;
  }
}
