

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meat_shop/screens/intro_screen.dart';
import 'package:meat_shop/screens/login%20&%20reg%20page/loginPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
   Timer(Duration(seconds: 5), () { 
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
   });
    super.initState();
  }
 
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height:200,
            width: 200,
             decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo-removebg-preview.png"),
                fit: BoxFit.cover
              )
             ),
          ),
        ),
      ),
    );
  }
}