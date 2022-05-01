import 'package:ferme_vaches_mobile/data/api/api_client.dart';
import 'package:ferme_vaches_mobile/widgets/app_constants.dart';
import 'package:get/get.dart';

class ProduitRepo extends GetxService {
  final ApiClient apiClient;
  ProduitRepo({required this.apiClient});

  Future<Response> getProduitList() async {
    return await apiClient.getData(AppConstans.PRODUIT_URL);
  }
}
