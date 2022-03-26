import 'package:dro_health/controller/cart_controller.dart';
import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/cart_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {


  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int qty = 1;
  String? _selectedCountry = "1";
  bool quantityCheck = false;
  List<int> itemsList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
  ];

  alterQuantity(){
    for(int i = 0; i < basket.length; i++){
      if(basket[i].quantity > 8){
        itemsList.add(basket[i].quantity);
      }
    }
    setState(() {
      quantityCheck = true;
    });
    print("$quantityCheck");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alterQuantity();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:  const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    dPurpleGradientLeft,
                    dPurpleGradientRight
                  ]),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))
          ),

        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Image.asset("assets/images/back_arrow.png")),
        title: Row(
          children: [
            Image.asset("assets/images/add-to-cart.png"),
            SizedBox(width: 10,),
            sText("Cart",color: Colors.white,weight: FontWeight.w700,size: 22,family: "ProximaBold"),
          ],
        ),
        elevation: 0,
        centerTitle: false,

      ),
      body: Container(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            basket.isNotEmpty && quantityCheck ?
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                  itemCount: basket.length,
                  itemBuilder: (BuildContext contex, int index){
                return   Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Image.asset("assets/images/${basket[index].productList!.productImage}.png",width: 80,height: 80,),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: sText("${basket[index].productList!.productName}",color: Colors.black,size: 16,family: "ProximaRegular"),
                              ),
                              Container(
                                child: sText("Tablet - ${basket[index].productList!.tabletMg}",color: Colors.grey[400]!,size: 14,family: "ProximaRegular"),
                              ),
                              Container(
                                child: sText("₦${(basket[index].productList!.amount! * basket[index].quantity).toStringAsFixed(2)}",color: Colors.black,weight: FontWeight.bold,size: 18,family: "ProximaAltSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              width: 65,
                              height: 35,
                              padding:  appPadding(8),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[400]!),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton(

                                      isExpanded: true,
                                      icon: Image.asset("assets/images/down.png"),
                                      underline: Container(),
                                      onChanged: (String? value) async{
                                        _selectedCountry = value;
                                        // await addToBasket(basket[index].productList!, int.parse(value!));
                                        CartItem item =  CartItem(
                                          productList: basket[index].productList,
                                          quantity: int.parse(value!),
                                        );
                                        basket[index] = item;
                                        setState(() {


                                        });

                                      },

                                      value: basket[index].quantity.toString(),
                                      items: itemsList.map<DropdownMenuItem<String>>((int value) {
                                        return DropdownMenuItem<String>(
                                          value: value.toString(),
                                          child: Row(
                                            children: <Widget>[
//                                SizedBox(width: 20),
                                              sText(value.toString(),align: TextAlign.center,size: 14,family: "ProximaRegular"),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            GestureDetector(
                              onTap: ()async{
                               setState(() {
                                 removeFromBasket(basket[index]);
                               });
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/remove.png"),
                                    sText("Remove",color: dPurple,size: 12,family: "ProximaRegular")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                   Container(
                     width: appWidth(context),
                     height: 1,
                     color: Colors.grey[400],
                   )
                  ],
                );
              }),
            ) : basket.isEmpty && !quantityCheck ? Expanded(child: Center(child: progress(),)) : Expanded(child: Center(child: sText("Empty Cart",family: "ProximaBold"),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: sText("Total: "),
                      ),
                      Container(
                        child: sText("₦${basketCost().toStringAsFixed(2)}",color: Colors.black,weight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                dPurpleGradientButton(
                      radius: 10,
                    content:sText("CHECKOUT",color: Colors.white,weight: FontWeight.bold),
                    onPressed: (){
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
