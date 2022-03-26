import 'package:dro_health/controller/cart_controller.dart';
import 'package:dro_health/controller/product_controller.dart';
import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/cart_model.dart';
import 'package:dro_health/model/product_model.dart';
import 'package:dro_health/screens/cart/index.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  ProductList? productList;
   ProductPage({this.productList}) ;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int qty = 1;

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
        title: sText("Pharmacy",color: Colors.white,weight: FontWeight.w700,size: 22,family: "ProximaBold"),
        elevation: 0,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: ()async{
              await goTo(context, CartPage());
              setState(() {

              });
            },
              child: Image.asset("assets/images/cart.png"),
          )
        ],
      ),
      body: Container(
        padding: appPadding(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(
             child: ListView(
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.center,

                   children: [
                     Center(
                       child: Container(
                         child: Image.asset("assets/images/${widget.productList!.productImage}.png"),
                       ),
                     ),
                     SizedBox(height: 10,),
                     Container(
                       child: sText("${widget.productList!.productName}",color: Colors.black,weight: FontWeight.w700,size: 20,family: "ProximaBold"),
                     ),
                     SizedBox(height: 10,),
                     Container(
                       child: sText("Tablet: ${widget.productList!.tabletMg}",color: Colors.grey,weight: FontWeight.w400,size: 18,family:"ProximaRegular" ),
                     ),
                   ],
                 ),
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       child: Row(
                         children: [
                           Container(
                             child: displayImage("assets/images/${widget.productList!.productImage}.png",radius: 20),
                           ),
                           SizedBox(width: 5,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Container(
                                 child: sText("SOLD BY: ",color: Colors.grey,weight: FontWeight.w400,size: 10,family: "ProximaRegular"),
                               ),
                               Container(
                                 child: sText("${widget.productList!.soldBy}",color: dMiddleBlue,weight: FontWeight.w700,size: 14,family: "ProximaBold"),
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                     Container(
                       child: Image.asset("assets/images/fav.png"),
                     )
                   ],
                 ),
                 SizedBox(height: 20,),
                 Row(
                   children: [
                     Container(
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: Colors.grey[200]!,width: 2)
                       ),
                       child: Row(
                         children: [
                           Container(
                             child: IconButton(onPressed: (){
                               setState(() {
                                 if(qty != 1){
                                   qty--;
                                 }

                               });
                             }, icon: Icon(Icons.remove),padding: EdgeInsets.zero,),
                           ),
                           Container(
                             child:sText("${qty}",size: 20,family: "ProximaBold"),
                           ),
                           Container(
                             child: IconButton(onPressed: (){
                               setState(() {
                                 qty++;
                               });
                             }, icon: Icon(Icons.add),padding: EdgeInsets.zero),
                           ),

                         ],
                       ),
                     ),
                     SizedBox(width: 10,),
                     Container(
                       child: sText("Pack(s)",color: Colors.grey[400]!,weight: FontWeight.w400,size: 14,family: "ProximaRegular"),
                     ),
                     Spacer(),
                     Stack(
                       children: [
                         Container(
                           margin: leftPadding(10),
                           child: Row(
                             children: [
                               Container(
                                 child: sText("${(widget.productList!.amount! * qty).toString().split(".").first}",color: Colors.black,weight: FontWeight.bold,size: 25,family: "ProximaBold"),
                               ),
                               Container(
                                 child: sText(".${(widget.productList!.amount! * qty).toStringAsFixed(2).toString().split(".").last}",color: Colors.black,weight: FontWeight.bold,size: 14,family: "ProximaBold"),
                               ),
                             ],
                           ),
                         ),
                         Positioned(
                           child: sText("₦",weight: FontWeight.w400,family: "ProximaRegular"),
                         )
                       ],
                     )
                   ],
                 ),
                 SizedBox(height: 20,),
                 Container(
                   child: sText("PRODUCT DETAILS",color: dMiddleBlue,weight: FontWeight.w700,align: TextAlign.left,size: 14,family: "ProximaBold"),
                 ),
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             child: Row(
                               children: [
                                 Container(
                                   child: Image.asset("assets/images/pack-size.png"),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                         child: sText("PACK SIZE",size: 10,weight: FontWeight.w400,color: dMiddleBlue,family: "ProximaRegular"),
                                       ),
                                       Container(
                                         child: sText("${widget.productList!.dosePack!.toStringAsFixed(0) + " x " + widget.productList!.numberTablet!.toStringAsFixed(0)} tablets (${widget.productList!.packSize!.toStringAsFixed(0)})",weight: FontWeight.w700,color: dMiddleBlue,size: 14,family: "ProximaBold"),
                                       ),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                           SizedBox(height: 10,),
                           Container(
                             child: Row(
                               children: [
                                 Container(
                                   child: Image.asset("assets/images/constituents.png"),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                         child: sText("CONSTITUENTS",size: 10,weight: FontWeight.w400,color: dMiddleBlue,family: "ProximaRegular"),
                                       ),
                                       Container(
                                         child: sText("${widget.productList!.constituent}",weight: FontWeight.w700,color: dMiddleBlue,size: 14,family: "ProximaBold"),
                                       ),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                     Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [

                           Container(
                             child: Row(
                               children: [
                                 Container(
                                   child: Image.asset("assets/images/product-id.png"),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                         child: sText("PRODUCT ID",size: 10,weight: FontWeight.w400,color: dMiddleBlue,family: "ProximaRegular"),
                                       ),
                                       Container(
                                         child: sText("${widget.productList!.productId}",weight: FontWeight.w700,color: dMiddleBlue,size: 14,family: "ProximaBold"),
                                       ),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                           SizedBox(height: 10,),
                           Container(
                             child: Row(
                               children: [
                                 Container(
                                   child: Image.asset("assets/images/dispense.png"),
                                 ),
                                 SizedBox(width: 10,),
                                 Container(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(
                                         child: sText("DISPENSE IN",size: 10,weight: FontWeight.w400,color: dMiddleBlue,family: "ProximaRegular"),
                                       ),
                                       Container(
                                         child: sText("${widget.productList!.dispenseIn}",weight: FontWeight.bold,color: dMiddleBlue,size: 14,family: "ProximaBold"),
                                       ),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                   ],

                 ),
                 SizedBox(height: 20,),
                 Container(
                   child: sText("${widget.productList!.description}",color: Colors.grey[400]!,weight: FontWeight.w400,align: TextAlign.left,size: 14,family: "ProximaRegular"),
                 ),
                 SizedBox(height: 20,),
                 Container(
                   child: sText("Similar Products",color: Colors.black,weight: FontWeight.bold,align: TextAlign.left,size: 18,family: "ProximaBold"),
                 ),
                 SizedBox(height: 10,),
                 Container(
                   height: 223,
                   child: ListView.builder(
                       shrinkWrap: true,
                       itemCount: listProducts.length,
                       scrollDirection: Axis.horizontal,
                       physics: ClampingScrollPhysics(),
                       itemBuilder: (BuildContext context, int index){
                         return    GestureDetector(
                           onTap: ()async{
                             await goTo(context, ProductPage(productList: listProducts[index],));
                             setState(() {

                             });
                           },
                           child: Stack(
                             children: [
                               Container(
                                 margin: EdgeInsets.only(left: 0,right: 10,top: 10,bottom: 5),
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(12),
                                     border: Border.all(color: Colors.grey[200]!)

                                 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: [
                                     Container(
                                       child: Image.asset("assets/images/${listProducts[index].productImage}.png",),
                                     ),

                                     Container(
                                       margin: topPadding(0),
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                                       ),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Container(
                                             padding: EdgeInsets.only(top: 5,left: 10),
                                             child: sText("${listProducts[index].productName}",color: Colors.black,size: 16,family: "ProximaRegular"),
                                           ),

                                           Container(
                                             padding: EdgeInsets.only(top: 0,left: 10),
                                             child: sText("Tablet * ${listProducts[index].tabletMg}",color: Colors.grey,size: 14,family: "ProximaRegular"),
                                           ),
                                           Container(
                                             padding: EdgeInsets.only(top: 5,left: 10,bottom: 5),
                                             child: sText("₦${listProducts[index].amount!.toStringAsFixed(2)}",weight: FontWeight.bold,size: 18,family: "ProximaAltSemiBold"),
                                           ),
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                               Positioned(
                                 bottom: 80,
                                 left: 0,
                                 right: 10,
                                 child:  listProducts[index].isPrescribed! ?
                                 Container(
                                   color: Colors.black87,
                                   padding: EdgeInsets.only(left: 0,),

                                   child: sText("Requires a prescription",size: 12,color: Colors.white,family: "ProximaAltSemiBold",align: TextAlign.center),
                                 ) : Container(),
                               )
                             ],
                           ),
                         );

                       }),
                 )
               ],
             ),
           ),
            dPurpleGradientButton(
              radius: 10,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/add-to-cart.png"),
                  SizedBox(width: 10,),
                  sText("Add to cart",color: Colors.white,weight: FontWeight.w700,size: 15,family: "ProximaBold")
                ],
              ),
              onPressed: ()async{
                print("hey");
                await addToBasket(widget.productList!, qty);
                setState(() {
                  print(basket.length);
                });
                addToCartModalBottomSheet(context,widget.productList!.productName!);
              }
            )
          ],
        ),
      ),
    );
  }
}
