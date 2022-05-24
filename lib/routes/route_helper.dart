import 'package:ferme_vaches_mobile/pages/home/main_home_page.dart';
import 'package:ferme_vaches_mobile/pages/produits/produit_detail_page.dart';
import 'package:ferme_vaches_mobile/pages/produits/recommanded_produit_details.dart';
import 'package:ferme_vaches_mobile/pages/splash/splash_page.dart';
import 'package:get/get.dart';

import '../pages/cart/cart_page.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String produits = "/produits";
  static const String recommandedProduits = "/recommanded";
  static const String cartPage = "/cart-page";

  static String getSpashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getProduit(int padeId, String page) =>
      '$produits?pageId=$padeId&page=$page';
  static String getRecommandedProduit(int pageId, String page) =>
      '$recommandedProduits?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
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
