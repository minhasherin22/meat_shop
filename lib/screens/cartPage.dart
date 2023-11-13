import 'package:flutter/material.dart';
import 'package:meat_shop/provider/meat_provider.dart';
import 'package:meat_shop/screens/intro_screen.dart';
import 'package:meat_shop/utility/colors.dart';
import 'package:meat_shop/utility/fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var carthome = context.watch<ProductProvider>().cartAll;
    num totalAmount = 0;
    for (var item in carthome) {
      totalAmount += (item.price * item.count);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>IntroScreen()));
            },
            child: Icon(Icons.arrow_back)),
          backgroundColor: tbclr2,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Cart",
                  style:appbarfont
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: carthome.length,
                  itemBuilder: (context, index) {
                    var item = carthome[index];
                    totalAmount = (item.price * item.count) + totalAmount;
    
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: tbclr2,
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(item.image),
                          ),
                          title: Text(item.name,style: font2,),
                          subtitle: Text('₹ ${item.price}\Kg',style: font2,),
                          trailing: Wrap(
                            children : [
                              Text(item.count.toString(),style: font2,),
                            IconButton(
                              onPressed: () => Provider.of<ProductProvider>(context, listen: false).removeFromCart(item),
                              icon: Icon(Icons.delete_outline),
                            ),
                      ]
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: tbclr2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: font2,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '₹ ${totalAmount.toString()}',
                              style: font2,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text(
                                "Pay Now",
                                style: font2
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}