import 'package:ferme_vaches_mobile/data/repository/produit_repo.dart';
import 'package:get/get.dart';

class ProduitController extends GetxController {
  final ProduitRepo produitRepo;

  ProduitController({required this.produitRepo});

  List<dynamic> _produitList = [];
  List<dynamic> get produitList => _produitList;

  Future<void> getProduitList() async {
    Response response = await produitRepo.getProduitList();
    if (response.statusCode == 200) {
      _produitList = [];
      //_produitList.addAll();
      update();
    } else {}
  }
}
