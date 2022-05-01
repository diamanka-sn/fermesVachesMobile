import 'package:ferme_vaches_mobile/data/repository/produit_repo.dart';
import 'package:ferme_vaches_mobile/model/produit_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommanded_repo.dart';

class RecommandedController extends GetxController {
  final RecommandedRepo recommandedRepo;

  RecommandedController({required this.recommandedRepo});

  List<dynamic> _recommandedProduitList = [];
  List<dynamic> get recommandedProduitList => _recommandedProduitList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommandedProduitList() async {
    Response response = await recommandedRepo.getRecommandedProduitList();
    if (response.statusCode == 200) {
      // print("Produits");
      _recommandedProduitList = [];
      _recommandedProduitList.addAll(Produits.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
