import 'package:dro_health/controller/category_controller.dart';
import 'package:dro_health/helper/helper.dart';
import 'package:dro_health/model/category_model.dart';
import 'package:dro_health/screens/cart/index.dart';
import 'package:dro_health/screens/category/get_product_by_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Image.asset("assets/images/back_arrow.png")),
        title: sText("Categories",color: Colors.white,weight: FontWeight.w700,size: 22,family: "ProximaBold"),
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
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
        child:  Column(
          children: [
            Expanded(
              child:  StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: listCategories.length,
                primary: false,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                      onTap: (){
                        goTo(context, GetProductByCategory(categoryList: listCategories[index],));
                      },
                      child: Container(
                        child: Stack(
                          children: [
                            Container(
                              child: Image.asset("assets/images/${listCategories[index].categoryName}.png",),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 60,
                              child: Container(
                                width: 150,
                                child: sText("${listCategories[index].categoryName}",color: Colors.white,align: TextAlign.center,family: "ProximaBold",weight: FontWeight.w700,size: 14.46),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                staggeredTileBuilder: (int index) =>
                 StaggeredTile.fit(2),
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
