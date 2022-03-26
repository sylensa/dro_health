import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/cart_model.dart';
import 'package:dro_health/model/product_model.dart';

List<CartItem> basket = [];

addToBasket(ProductList prod, int quantity) async{
  print("name:${prod.productName}");
  CartItem item =  CartItem(
    productList: prod,
    quantity: quantity,
  );
  bool found = false;
  if (basket.length > 0) {
    for (int i = 0; i < basket.length; i++) {
      CartItem testItem = basket[i];
      if(prod.productId ==  testItem.productList!.productId){
        print("exist:");
        found = true;
        testItem.quantity += quantity;
      }
    }
    if (!found) basket.add(item);

  } else {
    basket.add(item);
  }
  toast('Added to basket');
  return true;


}

totalQuantity() {
  int t_qty = 0;
  for (int i = 0; i < basket.length; i++) {
    t_qty += basket[i].quantity;
  }
  return t_qty;


}

removeFromBasket(CartItem cartItem) {
  for (int i = 0; i < basket.length; i++) {
    CartItem testItem = basket[i];
    if (cartItem.productList!.productId == testItem.productList!.productId ) {
      basket.removeAt(i);
      break;
    }
  }
  toast('Item removed');
}

emptyBasket(List<CartItem> basket) {
  basket.clear();
  toast('Item removed');
}

double basketCost() {
  double total = 0;
  if (basket.length > 0) {
    for (int i = 0; i < basket.length; i++) {
      CartItem testItem = basket[i];
      double x = testItem.productList!.amount!;
      total += (testItem.quantity * x);
    }
  }
  print("total: $total");
  return total;
}