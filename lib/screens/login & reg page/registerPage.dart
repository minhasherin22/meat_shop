import 'package:flutter/material.dart';
import 'package:meat_shop/screens/login%20&%20reg%20page/firebaseDb.dart';
import 'package:meat_shop/utility/colors.dart';
import 'package:meat_shop/screens/login%20&%20reg%20page/loginPage.dart';
import 'package:meat_shop/utility/fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final user_controller = TextEditingController();
  final pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tbclr1,
        appBar: AppBar(
          backgroundColor: tbclr2,
          centerTitle: true,
          title:  Text("REGISTER PAGE",style: appbarfont),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: user_controller,
                  decoration: InputDecoration(
                    
                     hintText: "User Name",hintStyle: font2,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,color: tbclr2),
                    borderRadius: BorderRadius.circular(15),
                  )),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: pass_controller,
                  decoration: InputDecoration(
                     hintText: "Password",hintStyle: font2,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,color: tbclr2),
                    borderRadius: BorderRadius.circular(15),
                  )),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tbclr2,
              
                  ),
                  onPressed: (){
                   String regname = user_controller.text;
                   String regpass = pass_controller.text;
                   firebaseHelper().register(regname:regname,regpass:regpass).then((result) {
                     if(result==null){
                        Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                     }else{
                       ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result)));
                     }
                   });
                  }, child:  Text("Register",style: font2)),
                  
              ),
                const SizedBox(height: 10,),
                TextButton(onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
                }, child: Icon(Icons.arrow_back,color: Colors.black,))
               
            ],
          ),
        ),
        ),
    );
  }
}