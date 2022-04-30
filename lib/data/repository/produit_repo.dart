import 'package:ferme_vaches_mobile/data/api/api_client.dart';
import 'package:get/get.dart';

class ProduitRepo extends GetxService {
  final ApiClient apiClient;
  ProduitRepo({required this.apiClient});

  Future<Response> getProduitList() async {
    return await apiClient.getData("https://www.dbestech.com/api/product/list");
  }
}
