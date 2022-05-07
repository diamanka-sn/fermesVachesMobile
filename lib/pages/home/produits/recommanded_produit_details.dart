import 'package:ferme_vaches_mobile/routes/route_helper.dart';
import 'package:ferme_vaches_mobile/utils/colors.dart';
import 'package:ferme_vaches_mobile/utils/dimensions.dart';
import 'package:ferme_vaches_mobile/widgets/app_icon.dart';
import 'package:ferme_vaches_mobile/widgets/big_text.dart';
import 'package:ferme_vaches_mobile/widgets/description_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommandedProduitDetail extends StatelessWidget {
  const RecommandedProduitDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear),
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                  size: Dimensions.font26,
                  text: "Lait 100% Naturel",
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: DescriptionText(
                      text:
                          "Plusieurs fournisseurs offrent certaines solutions qui permettent aux entreprises de migrer vers le monde IP. Des constructeurs de PABX tels que Nortel, Siemens, et Alcatel préfèrent la solution de l'intégration progressive de la VoIP en ajoutant des cartes extensions IP. Cette approche facilite l'adoption du téléphone IP surtout dans les grandes sociétés possédant une plateforme classique et voulant bénéficier de la voix sur IP. Mais elle ne permet pas de bénéficier de tous les services et la bonne intégration vers le monde des données. Le développement des logiciels PABX est la solution proposée par des fournisseurs tels que Cisco et Astérisque. Cette approche permet de bénéficier d'une grande efficacité flexible, d'une très bonne intégration au monde des données et de voix, et surtout d'un prix beaucoup plus intéressant.Plusieurs fournisseurs offrent certaines solutions qui permettent aux entreprises de migrer vers le monde IP. Des constructeurs de PABX tels que Nortel, Siemens, et Alcatel préfèrent la solution de l'intégration progressive de la VoIP en ajoutant des cartes extensions IP. Cette approche facilite l'adoption du téléphone IP surtout dans les grandes sociétés possédant une plateforme classique et voulant bénéficier de la voix sur IP. Mais elle ne permet pas de bénéficier de tous les services et la bonne intégration vers le monde des données. Le développement des logiciels PABX est la solution proposée par des fournisseurs tels que Cisco et Astérisque. Cette approche permet de bénéficier d'une grande efficacité flexible, d'une très bonne intégration au monde des données et de voix, et surtout d'un prix beaucoup plus intéressant. Plusieurs fournisseurs offrent certaines solutions qui permettent aux entreprises de migrer vers le monde IP. Des constructeurs de PABX tels que Nortel, Siemens, et Alcatel préfèrent la solution de l'intégration progressive de la VoIP en ajoutant des cartes extensions IP. Cette approche facilite l'adoption du téléphone IP surtout dans les grandes sociétés possédant une plateforme classique et voulant bénéficier de la voix sur IP. Mais elle ne permet pas de bénéficier de tous les services et la bonne intégration vers le monde des données. Le développement des logiciels PABX est la solution proposée par des fournisseurs tels que Cisco et Astérisque. Cette approche permet de bénéficier d'une grande efficacité flexible, d'une très bonne intégration au monde des données et de voix, et surtout d'un prix beaucoup plus intéressant.Ce rapport se compose de deux chapitres. Le premier chapitre introduit la voix sur IP et Asterisk. Le deuxième chapitre s'intéresse à la mise en place du serveur d’Asterisk."),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "1200 F" + " X " + "0",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
