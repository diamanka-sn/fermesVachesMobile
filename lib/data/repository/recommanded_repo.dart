import 'package:ferme_vaches_mobile/data/api/api_client.dart';
import 'package:ferme_vaches_mobile/widgets/app_constants.dart';
import 'package:get/get.dart';

class RecommandedRepo extends GetxService {
  final ApiClient apiClient;
  RecommandedRepo({required this.apiClient});

  Future<Response> getRecommandedProduitList() async {
    return await apiClient.getData(AppConstans.RECOMMANDED_PRODUIT_URL);
  }
}
