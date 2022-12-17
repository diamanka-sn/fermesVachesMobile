import 'package:ferme_vaches_mobile/data/repository/cart_repo.dart';
import 'package:ferme_vaches_mobile/model/produit_model.dart';
import 'package:ferme_vaches_mobile/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;
  List<CartModel> storageItems = [];

  void addItem(ProductModel produit, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(produit.id)) {
      _items.update(produit.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: produit,
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(produit.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(produit.id!, () {
          // _items.forEach((key, value) {});
          return CartModel(
            id: produit.id,
            name: produit.name,
            price: produit.price,
            img: produit.img,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: produit,
          );
        });
      } else {
        Get.snackbar("Compteur produit", "Ajouter au moins un produit!",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    cartRepo.addToCartList(getItems);
    update();
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

  int get totalCommande {
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

    for (var i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }

  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items = {};
    update();
  }

  List<CartModel> getCartHistoryList() {
    return cartRepo.getCartHistoryList();
  }
}
