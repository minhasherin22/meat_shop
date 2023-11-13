import 'package:flutter/material.dart';
import 'package:meat_shop/screens/fish.dart';
import 'package:meat_shop/screens/marinated.dart';
import 'package:meat_shop/screens/meat.dart';
import 'package:meat_shop/screens/ready_to_cook.dart';
import 'package:meat_shop/utility/colors.dart';
import 'package:meat_shop/utility/fonts.dart';
import 'package:meat_shop/utility/widgets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: tbclr2,
          title: Text("Fresh Meat", style: appbarfont),
        ),
        // backgroundColor: tbclr1,
        body: Column(
          children: [
            TapContainer(rimage: AssetImage("assets/cte_ready to cook.jpg"),page: RdyToCook(),),
            TapContainer(rimage: AssetImage("assets/cate_meat.jpg"), page: MeatPage()),
            TapContainer(rimage: AssetImage("assets/cate_fish.jpg"), page: Fish()),
            TapContainer(rimage: AssetImage("assets/cate_marinated.jpg"), page: MarinatedPage()),
            Text("Tap To View More",style: font2,)
          ],
        ),
      ),
    );
  }

  
}
