import 'package:ferme_vaches_mobile/controller/cart_controller.dart';
import 'package:ferme_vaches_mobile/controller/produit_controller.dart';
import 'package:ferme_vaches_mobile/controller/recommanded_controller.dart';
import 'package:ferme_vaches_mobile/data/repository/cart_repo.dart';
import 'package:ferme_vaches_mobile/data/repository/produit_repo.dart';
import 'package:ferme_vaches_mobile/data/repository/recommanded_repo.dart';
import 'package:ferme_vaches_mobile/widgets/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api_client.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));
//repos
  Get.lazyPut(() => ProduitRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommandedRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => ProduitController(produitRepo: Get.find()));
  Get.lazyPut(() => RecommandedController(recommandedRepo: Get.find()));
  Get.lazyPut(
    () => CartController(cartRepo: Get.find()),
  );
}
