import 'package:ferme_vaches_mobile/data/repository/cart_repo.dart';
import 'package:ferme_vaches_mobile/model/produit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel produit, int quantity) {
    if (_items.containsKey(produit.id)) {
      _items.update(produit.id!, (value) {
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    } else {
      _items.putIfAbsent(produit.id!, () {
        // _items.forEach((key, value) {});
        return CartModel(
            id: produit.id,
            name: produit.name,
            price: produit.price,
            img: produit.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    }
  }

  bool existInCart(ProductModel produit) {
    if (_items.containsKey(produit.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel produit) {
    var quantity = 0;
    if (_items.containsKey(produit.id)) {
      _items.forEach((key, value) {
        if (key == produit.id) {
          quantity = value.quantity!;
        }
      });
    }

    return quantity;
  }
}
