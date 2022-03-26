import 'package:dro_health/controller/cart_controller.dart';
import 'package:dro_health/controller/product_controller.dart';
import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/cart_model.dart';
import 'package:dro_health/model/product_model.dart';
import 'package:dro_health/screens/cart/index.dart';
import 'package:dro_health/screens/category/index.dart';
import 'package:dro_health/screens/product/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  String search;
  SearchPage({this.search = ''});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();
  List<ProductList> listSearchProducts = [];

  searchProduct(){
    print("search:${widget.search}");
    for(int i = 0; i < listProducts.length; i++){
      if(listProducts[i].productName!.toLowerCase().contains(widget.search.trim().toLowerCase())){
        listSearchProducts.add(listProducts[i]);
      }
    }

    setState(() {
      print("listSearchProducts:${listSearchProducts.length}");
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchProduct();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: scaffoldKey,
        body:  NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                expandedHeight: 120.0,
                automaticallyImplyLeading: false,
                floating: true,
                pinned: false,
                snap: true,
                title: sText("Pharmacy",color: Colors.white,weight: FontWeight.w700,size: 22,family: "ProximaBold"),
                centerTitle: false,
                leading:    IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Image.asset("assets/images/back_arrow.png")),
                actions: [
                  Container(child: Image.asset("assets/images/Group.png"))
                ],
                // backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,

                  background:   GestureDetector(
                    onTap: (){
                    },
                    child:   Container(
                      margin: topPadding(0),
                      padding: EdgeInsets.only(left: 20,right: 20),
                      width: appWidth(context),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                dPurpleGradientLeft,
                                dPurpleGradientRight
                              ]),
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),

                      ),
                        child:    Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 10,top: 10),
                                margin: topPadding(80),
                                child: Container(
                                  width: 250,
                                  child: TextFormField(
                                    readOnly: true,
                                    textInputAction: TextInputAction.search,
                                    decoration: textDecorNoBorder(hint: "${widget.search}",fill: Colors.white24,radius: 15,prefixIcon: Image.asset("assets/images/search.png"),hintWeight: FontWeight.w600,hintColor: Colors.white,hintSize: 20, family: "ProximaAltSemiBold"),
                                    onFieldSubmitted: (v){
                                      print(v);
                                      if(v.isNotEmpty){
                                        goTo(context, SearchPage(search: v,));
                                      }else{
                                        toast("Search must not be empty");
                                      }

                                    },
                                  ),
                                ),
                              ),
                            ),
                            listSearchProducts.isEmpty ?
                            SizedBox(width: 5,) : Container(),
                            listSearchProducts.isEmpty ?
                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: topPadding(80),
                                child: sText("Cancel",color: Colors.white,weight: FontWeight.w600,family: "ProximaAltSemiBold",size: 18),
                              ),
                            ) : Container()
                          ],
                        ),
                    ),
                  ),

                ),
              ),



            ];

          },

          body:Container(
            color: Colors.white,
            child: Column(
              children: [
                listSearchProducts.isNotEmpty ?
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        padding: appPadding(20),
                        color: Colors.grey[200],
                        child: Row(
                          children: [
                            Image.asset("assets/images/loc.png"),
                            SizedBox(width: 10,),
                            sText("Delivery in",color: Colors.black,family: "ProximaRegular",weight: FontWeight.w400),
                            SizedBox(width: 10,),
                            sText("Accra, GH",weight: FontWeight.w600,color: Colors.black,family: "ProximaAltSemiBold"),
                          ],
                        ),
                      ) ,
                      SizedBox(height: 10,),

                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        child: StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          itemCount: listSearchProducts.length,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                                onTap: ()async{
                                  await goTo(context, ProductPage(productList: listSearchProducts[index],));
                                  setState(() {

                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.grey[200]!)

                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Image.asset("assets/images/${listSearchProducts[index].productImage}.png",),
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
                                                  child: sText("${listSearchProducts[index].productName}",color: Colors.black,size: 16,family: "ProximaRegular"),
                                                ),

                                                Container(
                                                  padding: EdgeInsets.only(top: 0,left: 10),
                                                  child: sText("${listSearchProducts[index].tabletMg}",color: Colors.grey,size: 14,family: "ProximaRegular"),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(top: 5,left: 10,bottom: 10),
                                                      child: sText("₦${listSearchProducts[index].amount!.toStringAsFixed(2)}",weight: FontWeight.bold,size: 18,family: "ProximaAltSemiBold"),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(top: 5,right: 10,bottom: 10),

                                                      child: Image.asset("assets/images/fav.png"),
                                                    )
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: ()async{
                                                    print("hey");
                                                    await addToBasket(listSearchProducts[index], 1);
                                                    setState(() {
                                                      print(basket.length);
                                                    });
                                                    addToCartModalBottomSheet(context,listSearchProducts[index].productName!);                                                },
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 15,bottom: 10),
                                                    padding: appPadding(10),
                                                    child: sText("ADD TO CART",color: dPurple,weight: FontWeight.w700,size: 13,family: "ProximaBold"),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(color: dPurple,width: 1),
                                                      borderRadius: BorderRadius.circular(10)
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 150,
                                      left: 10,
                                      right: 10,
                                      child:  listSearchProducts[index].isPrescribed! ?
                                      Container(
                                        color: Colors.black87,
                                        padding: EdgeInsets.only(left: 0,),

                                        child: sText("Requires a prescription",size: 12,color: Colors.white,family: "ProximaAltSemiBold",align: TextAlign.center),
                                      ) : Container(),
                                    )
                                  ],
                                ),
                              ),
                          staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 0.0,
                        ),
                      )

                    ],
                  ),
                ):
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Image.asset("assets/images/404.png"),
                      ),
                      Center(
                        child: Container(
                          child:sText("No result found for \"${widget.search}\"",weight: FontWeight.w600,family: "ProximaAltSemiBold",size: 20),
                        ),
                      ),
                    ],
                  ),
                )



              ],
            ),
          ),
        ),
      floatingActionButton:
      GestureDetector(
        onTap: ()async{
          await goTo(context, CartPage());
          setState(() {

          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: appPadding(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white,width: 5),
                shape: BoxShape.circle,
                gradient:LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [dRedGradientLeft,dRedGradientRight]
                ),
              ),
              child: Column(
                  mainAxisAlignment:  MainAxisAlignment.end,
                children: [
                  Container(
                    padding: appPadding(5),
                    margin: leftPadding(10),
                    child: sText("${totalQuantity()}",color: Colors.black,weight: FontWeight.bold,size: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow
                    ),
                  ),
                  Image.asset("assets/images/add-to-cart.png",color: Colors.white,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

