import 'package:ferme_vaches_mobile/controller/produit_controller.dart';
import 'package:ferme_vaches_mobile/controller/recommanded_controller.dart';
import 'package:ferme_vaches_mobile/pages/home/main_home_page.dart';
import 'package:ferme_vaches_mobile/routes/route_helper.dart';
import 'package:ferme_vaches_mobile/utils/colors.dart';
import 'package:ferme_vaches_mobile/utils/dimensions.dart';
import 'package:ferme_vaches_mobile/widgets/app_constants.dart';
import 'package:ferme_vaches_mobile/widgets/app_icon.dart';
import 'package:ferme_vaches_mobile/widgets/big_text.dart';
import 'package:ferme_vaches_mobile/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: Dimensions.height20 * 2,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainHomePage());
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                // SizedBox(
                //   width: Dimensions.width20 + 5,
                // ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            )),
        Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
                margin: EdgeInsets.only(top: Dimensions.height10),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            width: double.maxFinite,
                            height: Dimensions.height20 * 5,
                            child: Row(children: [
                              GestureDetector(
                                onTap: () {
                                  var produitIndex =
                                      Get.find<ProduitController>()
                                          .produitList
                                          .indexOf(_cartList[index].product!);
                                  if (produitIndex >= 0) {
                                    Get.toNamed(RouteHelper.getProduit(
                                        produitIndex, "cartpage"));
                                  } else {
                                    var recommandedIndex =
                                        Get.find<RecommandedController>()
                                            .recommandedProduitList
                                            .indexOf(_cartList[index].product!);
                                    Get.toNamed(
                                        RouteHelper.getRecommandedProduit(
                                            recommandedIndex, "cartpage"));
                                  }
                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstans.BASE_URL +
                                                  AppConstans.UPLOAD_URL +
                                                  cartController
                                                      .getItems[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                  child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                      text:
                                          cartController.getItems[index].name!,
                                      color: Colors.black54,
                                    ),
                                    SmallText(text: "Consomes a votre rythme"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text:
                                              "${cartController.getItems[index].price! * _cartList[index].quantity!} F cfa",
                                          color: Colors.redAccent,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10,
                                              left: Dimensions.width10,
                                              right: Dimensions.width10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white),
                                          child: Row(children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                    _cartList[index].product!,
                                                    -1);
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: AppColors.signColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            BigText(
                                                text: _cartList[index]
                                                    .quantity
                                                    .toString()), //produits.inCartItems.toString()""),
                                            SizedBox(
                                              width: Dimensions.width10 / 2,
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(
                                                      _cartList[index].product!,
                                                      1);
                                                },
                                                child: Icon(Icons.add,
                                                    color: AppColors.signColor))
                                          ]),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ]),
                          );
                        });
                  }),
                ))),
      ]),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
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
                    child: Row(children: [
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(
                          text: cartController.totalCommande.toString() +
                              " F cfa"),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      //  produits.addItem(produit);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: BigText(
                        text: "Commander",
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                    ),
                  )
                ]),
          );
        },
      ),
    );
  }
}
