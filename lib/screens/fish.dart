import 'package:flutter/material.dart';
import 'package:meat_shop/screens/cartPage.dart';
import 'package:meat_shop/screens/intro_screen.dart';
import 'package:meat_shop/utility/colors.dart';
import 'package:meat_shop/utility/fonts.dart';
import 'package:provider/provider.dart';
import '../provider/meat_provider.dart';

class Fish extends StatefulWidget {
  const Fish({super.key});

  @override
  State<Fish> createState() => _FishState();
}

class _FishState extends State<Fish> {
  @override
  Widget build(BuildContext context) {
     var ListOfFish = context.watch<ProductProvider>().fishhome;
    var cartpro = context.watch<ProductProvider>().cartAll;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap:(){ Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>IntroScreen()));},
              child: Icon(Icons.arrow_back,color: Colors.black,)),
            centerTitle: true,
            backgroundColor: tbclr2,
            title: Text(
              "Fish",
              style: appbarfont,
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: tbclr2),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CartPage()));
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: tbclr1,
                    ),
                    label: Text(
                      " ${cartpro.length}",
                      style: font2,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.builder(
                      itemCount: fishList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                             Stack(
                               children: [
                                Container(
                                height: 100,
                                width: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image:AssetImage(ListOfFish[index].image))
                                ),
                               ),
                               Positioned(
                                left: 100,
                                bottom: 70,
                                child: Container(
                                  height: 30,
                                  width: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: tbclr2),
                                    onPressed: (){
                                     Provider.of<ProductProvider>(context,listen: false).addtoCart(ListOfFish[index]);
                                    },
                                     child: Icon(Icons.add,color: Colors.black,)),
                                ))
                               ]
                             ),
                            Text('${ListOfFish[index].name}',style: font2,),
                            Text('${ListOfFish[index].price}',style: font2,),
                            
      
                          ],
                        );
                      }))
            ],
          ),
      ),
    );
  }
}