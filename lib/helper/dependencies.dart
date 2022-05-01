import 'package:ferme_vaches_mobile/controller/produit_controller.dart';
import 'package:ferme_vaches_mobile/controller/recommanded_controller.dart';
import 'package:ferme_vaches_mobile/data/repository/produit_repo.dart';
import 'package:ferme_vaches_mobile/data/repository/recommanded_repo.dart';
import 'package:ferme_vaches_mobile/widgets/app_constants.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstans.BASE_URL));
//repos
  Get.lazyPut(() => ProduitRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommandedRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => ProduitController(produitRepo: Get.find()));
  Get.lazyPut(() => RecommandedController(recommandedRepo: Get.find()));
}
