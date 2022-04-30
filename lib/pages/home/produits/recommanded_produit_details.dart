import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommandedProduitDetail extends StatelessWidget {
  const RecommandedProduitDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/1.jpg",
                width: double.maxFinite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
