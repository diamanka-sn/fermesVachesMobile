import 'package:ferme_vaches_mobile/controller/produit_controller.dart';
import 'package:ferme_vaches_mobile/controller/recommanded_controller.dart';
import 'package:ferme_vaches_mobile/pages/home/bovin_page_body.dart';
import 'package:ferme_vaches_mobile/pages/home/main_home_page.dart';
import 'package:ferme_vaches_mobile/pages/home/produits/produit_detail_page.dart';
import 'package:ferme_vaches_mobile/pages/home/produits/recommanded_produit_details.dart';
import 'package:ferme_vaches_mobile/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<ProduitController>().getProduitList();
    Get.find<RecommandedController>().getRecommandedProduitList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KosSam Ferme',
      // theme: ThemeData(
      //   primarySwatch: Colors.green,
      // ),
      //home: MainHomePage(),
      home: MainHomePage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
