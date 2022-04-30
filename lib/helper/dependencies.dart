import 'package:ferme_vaches_mobile/controller/produit_controller.dart';
import 'package:ferme_vaches_mobile/data/repository/produit_repo.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));
//repos
  Get.lazyPut(() => ProduitRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => ProduitController(produitRepo: Get.find()));
}
