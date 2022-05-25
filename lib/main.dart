import 'package:ferme_vaches_mobile/controller/cart_controller.dart';
import 'package:ferme_vaches_mobile/controller/produit_controller.dart';
import 'package:ferme_vaches_mobile/controller/recommanded_controller.dart';
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
    Get.find<CartController>().getCartData();
    return GetBuilder<ProduitController>(builder: (_) {
      return GetBuilder<RecommandedController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'KosSam Ferme',
          // home: SplashScreen(),
          initialRoute: RouteHelper.getSpashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
