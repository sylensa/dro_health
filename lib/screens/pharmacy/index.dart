import 'package:dro_health/controller/cart_controller.dart';
import 'package:dro_health/controller/category_controller.dart';
import 'package:dro_health/controller/product_controller.dart';
import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/cart_model.dart';
import 'package:dro_health/model/category_model.dart';
import 'package:dro_health/model/product_model.dart';
import 'package:dro_health/screens/cart/index.dart';
import 'package:dro_health/screens/category/get_product_by_category.dart';
import 'package:dro_health/screens/category/index.dart';
import 'package:dro_health/screens/product/index.dart';
import 'package:dro_health/screens/search/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    dPurpleGradientLeft,
                    dPurpleGradientRight
                  ])
          ),
        ),
        title: sText("Pharmacy",color: Colors.white,weight: FontWeight.w700,size: 22,family: "ProximaBold"),
        elevation: 0,
        centerTitle: false,
        actions: [
            Image.asset("assets/images/Group.png")
        ],
      ),
      body: Container(
          child: Column(
            children: [
              Container(
                padding: appPadding(20),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          dPurpleGradientLeft,
                          dPurpleGradientRight
                        ]),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                ),
                child: TextFormField(
                    textInputAction: TextInputAction.search,
                    style: appStyle(col: Colors.white,weight: FontWeight.bold),
                  decoration: textDecorNoBorder(hint: "Search",fill: Colors.white24,radius: 15,prefixIcon: Image.asset("assets/images/search.png"),hintWeight: FontWeight.w600,hintColor: Colors.white,hintSize: 20,family: "ProximaAltSemiBold"),
                  onFieldSubmitted: (v)async{
                    print(v);
                    if(v.isNotEmpty){
                      await goTo(context, SearchPage(search: v,));
                      setState(() {

                      });
                    }else{
                      toast("Search must not be empty");
                    }

                  },
                ),
              ),
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
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: sText("CATEGORIES",color: Colors.grey,weight: FontWeight.w600,family: "ProximaAltSemiBold",size: 16),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              await goTo(context, CategoryPage());
                              setState(() {

                              });
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
                      padding: EdgeInsets.only(left: 5,right: 5,top: 0),

                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                          itemCount: listCategories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index){
                            return  GestureDetector(
                              onTap: ()async{
                                await goTo(context, GetProductByCategory(categoryList: listCategories[index],));
                                setState(() {

                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset("assets/images/${listCategories[index].categoryName}.png",height: 120),
                                    ),
                                  ),
                                  Positioned(
                                      left: 10,
                                      bottom: 50,
                                      child: Container(
                                        width: 150,
                                          child: sText("${listCategories[index].categoryName}",color: Colors.white,align: TextAlign.center,family: "ProximaBold",weight: FontWeight.w700,size: 14.46),
                                      ),
                                  )
                                ],
                              ),
                            );

                      }),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 0),
                      child: sText("SUGGESTIONS",color: Colors.grey,weight: FontWeight.w600,size: 16,family: "ProximaAltSemiBold"),
                    ),
                      SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: StaggeredGridView.countBuilder(
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
      floatingActionButton:
      GestureDetector(
        onTap: ()async{
          await goTo(context, CartPage());
          setState(() {

          });
        },
        child: Container(
          width: 130,
          padding: appPadding(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white,width: 2),
            borderRadius: BorderRadius.circular(30),

            gradient:LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [dRedGradientLeft,dRedGradientRight]
            ),
          ),
          child: Row(
            children: [
              sText("Checkout",color: Colors.white,family: "ProximaBold",size: 14),
              Image.asset("assets/images/add-to-cart.png"),
              SizedBox(width: 5,),
              Container(
                padding: appPadding(3),
                child: sText("${totalQuantity()}",color: Colors.black,weight: FontWeight.bold,size: 12,family: "ProximaBold"),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
