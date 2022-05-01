import 'package:ferme_vaches_mobile/data/repository/produit_repo.dart';
import 'package:ferme_vaches_mobile/model/produit_model.dart';
import 'package:get/get.dart';

class ProduitController extends GetxController {
  final ProduitRepo produitRepo;

  ProduitController({required this.produitRepo});

  List<dynamic> _produitList = [];
  List<dynamic> get produitList => _produitList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getProduitList() async {
    Response response = await produitRepo.getProduitList();
    if (response.statusCode == 200) {
      // print("Produits");
      _produitList = [];
      _produitList.addAll(Produits.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
