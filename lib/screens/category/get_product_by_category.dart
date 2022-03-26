import 'package:dro_health/controller/category_controller.dart';
import 'package:dro_health/controller/product_controller.dart';
import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/category_model.dart';
import 'package:dro_health/model/product_model.dart';
import 'package:dro_health/screens/cart/index.dart';
import 'package:dro_health/screens/category/index.dart';
import 'package:dro_health/screens/product/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GetProductByCategory extends StatefulWidget {
  CategoryList? categoryList;
   GetProductByCategory({this.categoryList});

  @override
  _GetProductByCategoryState createState() => _GetProductByCategoryState();
}

class _GetProductByCategoryState extends State<GetProductByCategory> {
  GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

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
                // expandedHeight: 400.0,
                automaticallyImplyLeading: false,
                floating: true,
                pinned: false,
                snap: true,
                leading:    IconButton(onPressed: (){
            Navigator.pop(context);
            }, icon: Image.asset("assets/images/back_arrow.png")),
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
                // backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  title: sText("Categories",color: Colors.white,weight: FontWeight.w700,size: 22,family: "ProximaBold"),
                  centerTitle: false,
                  background:   GestureDetector(
                    onTap: (){
                    },
                    child:   Container(
                      margin: topPadding(0),
                      padding: EdgeInsets.only(left: 10,right: 10),
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
                              bottomRight: Radius.circular(15))
                      ),
                    ),
                  ),

                ),
              ),



            ];

          },

          body:Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: topPadding(10),
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: sText("CATEGORIES",color: Colors.grey,weight: FontWeight.w600,family: "ProximaAltSemiBold",size: 16),
                            ),
                            GestureDetector(
                              onTap: (){
                                goTo(context, CategoryPage());
                              },
                              child: Container(
                                child: sText("VIEW ALL",color: dPurple,weight: FontWeight.w600,family: "ProximaAltSemiBold",size: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: listCategories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index){
                              return  GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                      widget.categoryList = listCategories[index];
                                  });
                                },
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(

                                          child: Image.asset("assets/images/${listCategories[index].categoryName}.png",height: 120),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      bottom: 50,
                                      child: Container(
                                        width: 150,
                                        child: sText("${listCategories[index].categoryName}",color: Colors.white,align: TextAlign.center,family: "ProximaBold",weight: FontWeight.w700),
                                      ),
                                    ),
                                    widget.categoryList!.categoryId == listCategories[index].categoryId ?
                                    Positioned(
                                      left: 15,
                                      top: 10,
                                      child: Container(
                                        width: 136,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            color: Colors.black26 ,
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: <Color>[
                                                  dPurpleGradientLeft,
                                                  dPurpleGradientRight
                                                ]),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                    ) : Container()
                                  ],
                                ),
                              );

                            }),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 0),
                        child: sText("${widget.categoryList!.categoryName.toUpperCase()}",color: Colors.grey,weight: FontWeight.w600,size: 16,family: "ProximaAltSemiBold"),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 10),

                        child:  StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          itemCount: listProducts.length,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                                onTap: ()async{
                                  await goTo(context, ProductPage(productList: listProducts[index],));
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
                                                  padding: EdgeInsets.only(top: 5,left: 10,bottom: 10),
                                                  child: sText("₦${listProducts[index].amount!.toStringAsFixed(2)}",weight: FontWeight.bold,size: 18,family: "ProximaAltSemiBold"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 90,
                                      left: 10,
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
                              ),
                          staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      )
                    ],
                  ),
                )



              ],
            ),
          ),
        )
    );
  }
}

