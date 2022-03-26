import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/product_model.dart';

class CartItem{
  ProductList? productList ;
  int quantity;

  CartItem({this.productList,this.quantity = 1});
}
