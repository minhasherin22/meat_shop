import 'package:flutter/material.dart';
import 'package:meat_shop/model/meat_model.dart';

 List<Product>fishList = [
Product(image:"assets/fi_karimeen.jpg" , name: "Karimeen", price: 250),
Product(image: "assets/fi_lobster.jpg", name: "Lobster", price: 350),
Product(image: "assets/fi_mackerel.jpg", name: "Mackerel", price: 200),
Product(image: "assets/fi_prawns.jpg", name: "Prawns", price: 240),
Product(image: "assets/fi_salmon.jpeg", name: "Salmon", price: 220),
Product(image: "assets/fi_squid.jpg", name: "Squid", price: 300),
Product(image: "assets/fi_tuna.jpg", name: "Tuna", price: 234)
];

 List<Product>meatList = [
  Product(image: "assets/m_beef.jpg", name: "Beef", price: 350),
  Product(image: "assets/m_chichen.jpg", name: "Chicken", price: 200),
  Product(image: "assets/m_duck.jpg", name: "Duck", price: 220),
  Product(image: "assets/m_mutton.jpg", name: "mutton", price: 400),
  Product(image: "assets/m_pork (1).jpg", name: "POrk", price: 220)
];
 List<Product>marinateList = [
  Product(image: "assets/ma_beef.jpg", name: "Beef", price:400),
  Product(image: "assets/ma_chicken.jpg", name: "Chicken", price: 300),
  Product(image: "assets/ma_fish.jpg", name: "fish", price: 300),
  Product(image: "assets/ma_mutton.jpg", name: "Mutton", price: 480)
];
 List<Product>rdytocookList = [
  Product(image: "assets/rtc_friedchicken-removebg-preview.png", name: "Ready to eat Chicken", price:300),
  Product(image: "assets/rtc_mockmeat-removebg-preview.png", name: "Mockmeat", price: 350),
  Product(image: "assets/rtc_roast_pork-removebg-preview.png", name: "Roast POrk", price: 380),
  Product(image: "assets/rtc_soya-removebg-preview.png", name: "Soya", price: 150),
  Product(image: "assets/rtc_vegan_Like_Chicken-removebg-preview.png", name: "Chicken", price: 350),
  Product(image: "assets/rtc_vindaloo_paste-removebg-preview.png", name: "Vindaloo Paste", price: 330)
];

class ProductProvider extends ChangeNotifier{
 var fish = fishList;
  List<Product> get fishhome => fish;

 var meat = meatList;
  List<Product> get meathome => meat;

  var marinated = marinateList;
  List<Product> get marinatedhome => marinated;

var readyToEat = rdytocookList;
  List<Product> get readyToEatHome => readyToEat;

 final List<Product> cart = [];
 List<Product> get cartAll => cart;

 void addtoCart(Product thingsFromList){
  int index = cart.indexWhere((element) => element == thingsFromList);
  if(index != -1){
    cart[index].count = cart[index].count+1;
  }else{
    cart.add(thingsFromList);
  }
  notifyListeners();
 }

 void removeFromCart(Product thingsremovecart){
  int index = cart.indexWhere((element) => element == thingsremovecart);
  if(index != -1){
    if(cart[index].count>1){
      cart[index].count--;
    }else{
      cart.removeAt(index);
    }
  }
  notifyListeners();
 }
}