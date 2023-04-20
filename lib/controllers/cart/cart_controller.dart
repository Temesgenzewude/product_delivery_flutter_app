import 'package:food_delivery/data/repository/cart/cart_repo.dart';
import 'package:food_delivery/models/cart/cart_model.dart';
import 'package:food_delivery/models/product/products_model.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  /// only for storage and shared preferences
  List<CartModel> storageItems = [];

  Map<int, CartModel> get cartItems => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      // print("Exists and updating");
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: totalQuantity,
            isExist: true,
            product: product,
            time: DateTime.now().toString());
      });

      if (totalQuantity <= 0) {
        // print("Exists and removing ");
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        // print("Absent and adding");
        _items.putIfAbsent(
            product.id!,
            () => CartModel(
                id: product.id,
                name: product.name,
                price: product.price,
                img: product.img,
                quantity: quantity,
                isExist: true,
                product: product,
                time: DateTime.now().toString()));
      } else {
        Get.snackbar(
          
            "Item Count", "You should add at least one item in the cart !",
            backgroundColor: Color(0xFF262626), colorText: Colors.white);
      }
    }
    cartRepo.addToCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductModel productModel) {
    var quantity = 0;
    if (_items.containsKey(productModel.id)) {
      // to be optimized later
      _items.forEach((key, value) {
        if (key == productModel.id) {
          quantity = value.quantity!;
        }
      });
    }

    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepo.getCartList();

    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
    print("The length of cart items is ${storageItems.length}");

    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToCartHistoryList() {
    cartRepo.addToCartHistoryList();
    clearFromCart();
  }

  void clearFromCart() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }

  set setItems(Map<int, CartModel> newItems) {
    _items = {};
    _items = newItems;
  }

  void addToCartList() {
    cartRepo.addToCartList(getItems);
    update(); 
  }
}
