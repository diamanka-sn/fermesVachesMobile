import 'package:ferme_vaches_mobile/controller/cart_controller.dart';
import 'package:ferme_vaches_mobile/controller/produit_controller.dart';
import 'package:ferme_vaches_mobile/controller/recommanded_controller.dart';
import 'package:ferme_vaches_mobile/pages/home/cart/cart_page.dart';
import 'package:ferme_vaches_mobile/routes/route_helper.dart';
import 'package:ferme_vaches_mobile/utils/colors.dart';
import 'package:ferme_vaches_mobile/utils/dimensions.dart';
import 'package:ferme_vaches_mobile/widgets/app_constants.dart';
import 'package:ferme_vaches_mobile/widgets/app_icon.dart';
import 'package:ferme_vaches_mobile/widgets/big_text.dart';
import 'package:ferme_vaches_mobile/widgets/description_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommandedProduitDetail extends StatelessWidget {
  final int pageId;
  const RecommandedProduitDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommandedController>().recommandedProduitList[pageId];
    Get.find<ProduitController>()
        .initProduit(product, Get.find<CartController>());
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
                    // AppIcon(icon: Icons.shopping_cart_outlined),
                    GetBuilder<ProduitController>(builder: (p) {
                      return Stack(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.to(() => CartPage());
                              },
                              child:
                                  AppIcon(icon: Icons.shopping_cart_outlined)),
                          Get.find<ProduitController>().totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<ProduitController>().totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: BigText(
                                    text: Get.find<ProduitController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      );
                    })
                  ]),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: BigText(
                    size: Dimensions.font26,
                    text: product.name!,
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
                background: Image.network(
                  AppConstans.BASE_URL + AppConstans.UPLOAD_URL + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child: DescriptionText(text: product.description!),
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GetBuilder<ProduitController>(
          builder: (prod) {
            return Column(
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
                      GestureDetector(
                        onTap: () {
                          prod.setQuantity(false);
                        },
                        child: AppIcon(
                            iconSize: Dimensions.iconSize24,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            icon: Icons.remove),
                      ),
                      BigText(
                        text: "${product.price!} F cfa X ${prod.inCartItems}",
                        color: AppColors.mainBlackColor,
                        size: Dimensions.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          prod.setQuantity(true);
                        },
                        child: AppIcon(
                            iconSize: Dimensions.iconSize24,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            icon: Icons.add),
                      )
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
                          child: BigText(
                            text: "${product.price * prod.inCartItems} F cfa",
                            color: AppColors.mainColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            prod.addItem(product);
                          },
                          child: Container(
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
                          ),
                        )
                      ]),
                ),
              ],
            );
          },
        ));
  }
}
