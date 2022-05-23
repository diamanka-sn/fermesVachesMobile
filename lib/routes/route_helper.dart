import 'package:ferme_vaches_mobile/pages/home/main_home_page.dart';
import 'package:ferme_vaches_mobile/pages/home/produits/produit_detail_page.dart';
import 'package:ferme_vaches_mobile/pages/home/produits/recommanded_produit_details.dart';
import 'package:get/get.dart';

import '../pages/home/cart/cart_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String produits = "/produits";
  static const String recommandedProduits = "/recommanded";
  static const String cartPage = "/cart-page";

  static String getInitial() => '$initial';
  static String getProduit(int padeId, String page) =>
      '$produits?pageId=$padeId&page=$page';
  static String getRecommandedProduit(int pageId, String page) =>
      '$recommandedProduits?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainHomePage()),
    GetPage(
        name: produits,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return ProduitDetailPage(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommandedProduits,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommandedProduitDetail(
              pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
