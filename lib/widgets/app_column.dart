import 'package:ferme_vaches_mobile/utils/colors.dart';
import 'package:ferme_vaches_mobile/utils/dimensions.dart';
import 'package:ferme_vaches_mobile/widgets/big_text.dart';
import 'package:ferme_vaches_mobile/widgets/icon_and_text_widget.dart';
import 'package:ferme_vaches_mobile/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int price;
  const AppColumn({Key? key, required this.text, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: text,
        size: Dimensions.font26,
      ),
      SizedBox(
        height: Dimensions.height10,
      ),
      Row(
        children: [
          Wrap(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: AppColors.mainColor,
                size: 15,
              );
            }),
          ),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "4.5"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "1287"),
          SizedBox(
            width: 10,
          ),
          SmallText(text: "Comments")
        ],
      ),
      SizedBox(
        height: Dimensions.height20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(
            icon: Icons.circle_sharp,
            text: price.toString() + " F cfa",
            iconColor: AppColors.iconColor1,
          ),
          IconAndTextWidget(
            icon: Icons.location_on,
            text: "1.7km",
            iconColor: AppColors.mainColor,
          ),
          IconAndTextWidget(
            icon: Icons.access_time_rounded,
            text: "32min",
            iconColor: AppColors.iconColor2,
          ),
        ],
      )
    ]);
  }
}
