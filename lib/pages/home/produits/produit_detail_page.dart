import 'package:ferme_vaches_mobile/utils/colors.dart';
import 'package:ferme_vaches_mobile/utils/dimensions.dart';
import 'package:ferme_vaches_mobile/widgets/app_column.dart';
import 'package:ferme_vaches_mobile/widgets/app_icon.dart';
import 'package:ferme_vaches_mobile/widgets/big_text.dart';
import 'package:ferme_vaches_mobile/widgets/description_text.dart';
import 'package:ferme_vaches_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/icon_and_text_widget.dart';

class ProduitDetailPage extends StatelessWidget {
  const ProduitDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //Image arriere plan
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/1.jpg"))),
              )),
          //icone retour et panier
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          //Details du produits
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: "Lait 100% naturel"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Description"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: DescriptionText(
                              text:
                                  "Plusieurs fournisseurs offrent certaines solutions qui permettent aux entreprises de migrer vers le monde IP. Des constructeurs de PABX tels que Nortel, Siemens, et Alcatel préfèrent la solution de l'intégration progressive de la VoIP en ajoutant des cartes extensions IP. . Cette approche facilite l'adoption du téléphone IP surtout dans les grandes sociétés possédant une plateforme classique et voulant bénéficier de la voix sur IP. Mais elle ne permet pas de bénéficier de tous les services et la bonne intégration vers le monde des données. Le développement des logiciels PABX est la solution proposée par des fournisseurs tels que Cisco et Astérisque. Cette approche permet de bénéficier d'une grande efficacité flexible, d'une très bonne intégration au monde des données et de voix, et surtout d'un prix beaucoup plus intéressant. Cette approche facilite l'adoption du téléphone IP surtout dans les grandes sociétés possédant une plateforme classique et voulant bénéficier de la voix sur IP. Mais elle ne permet pas de bénéficier de tous les services et la bonne intégration vers le monde des données. Le développement des logiciels PABX est la solution proposée par des fournisseurs tels que Cisco et Astérisque. Cette approche permet de bénéficier d'une grande efficacité flexible, d'une très bonne intégration au monde des données et de voix, et surtout d'un prix beaucoup plus intéressant."),
                        ),
                      )
                    ],
                  )))
          //Description des produits
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2))),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white),
            child: Row(children: [
              Icon(
                Icons.remove,
                color: AppColors.signColor,
              ),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              BigText(text: "0"),
              SizedBox(
                width: Dimensions.width10 / 2,
              ),
              Icon(Icons.add, color: AppColors.signColor)
            ]),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            child: BigText(
              text: "Ajouter au panier",
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor),
          )
        ]),
      ),
    );
  }
}
