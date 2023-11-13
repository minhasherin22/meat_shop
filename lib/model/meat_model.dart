class Product{
  final String name;
  final int price;
  final String image;
  int count;
  Product({required this.image,required this.name,required this.price,this.count = 1});
}