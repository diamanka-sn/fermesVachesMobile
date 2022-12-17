import 'dart:convert';

import 'package:ferme_vaches_mobile/model/cart_model.dart';
import 'package:ferme_vaches_mobile/widgets/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cart = [];
    // convertir les object en string
    // cartList.forEach((element) {
    //   return cart.add(jsonEncode(element));
    // });

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstans.CART_LIST, cart);
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstans.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstans.CART_LIST)!;
    }
    List<CartModel> cartList = [];

    // carts.forEach((element) {
    //   cartList.add(CartModel.fromJson(jsonDecode(element)));
    // });

    carts.forEach(
        (element) => cartList.add(CartModel.fromJson(jsonDecode(element))));
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstans.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstans.CART_HISTORY_LIST)!;
    }
    List<CartModel> cartListHistory = [];
    cart.forEach((element) =>
        cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstans.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstans.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstans.CART_LIST);
  }
}
