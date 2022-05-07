import 'package:ferme_vaches_mobile/pages/home/main_home_page.dart';
import 'package:ferme_vaches_mobile/pages/home/produits/produit_detail_page.dart';
import 'package:ferme_vaches_mobile/pages/home/produits/recommanded_produit_details.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String produits = "/produits";
  static const String recommandedProduits = "/recommanded";

  static String getInitial() => '$initial';
  static String getProduit(int padeId) => '$produits?pageId=$padeId';
  static String getRecommandedProduit() => '$recommandedProduits';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainHomePage()),
    GetPage(
        name: produits,
        page: () {
          var pageId = Get.parameters['pageId'];
          return ProduitDetailPage(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommandedProduits,
        page: () {
          return RecommandedProduitDetail();
        },
        transition: Transition.fadeIn),
  ];
}
