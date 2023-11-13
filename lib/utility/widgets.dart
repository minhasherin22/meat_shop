import 'package:flutter/material.dart';

class TapContainer extends StatelessWidget {
 final ImageProvider rimage;
 final Widget page;
 TapContainer({required this.rimage,required this.page});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: EdgeInsets.all(15),
            child: Stack(children: [
              GestureDetector(
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: rimage
                          )),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>page));
                },
              ),
            ]),
          );
  }
}
