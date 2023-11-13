import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meat_shop/provider/meat_provider.dart';
import 'package:meat_shop/screens/login%20&%20reg%20page/splashscreen.dart';
import 'package:provider/provider.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:'AIzaSyBHAV-0cd-_mD2Fr5CwmEU3F_zlUSq7Gls' ,
      appId:'1:856002620487:android:1afdcc33c63267e80e1562', 
      messagingSenderId: '856002620487', 
      projectId: 'meatshop-d9344')
  );
   User? user = FirebaseAuth.instance.currentUser;
  runApp(ChangeNotifierProvider<ProductProvider>(create: (BuildContext context)=>ProductProvider(),
  child: MaterialApp(home: MyApp(),),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home:SplashScreen(),
    );
  }
}

