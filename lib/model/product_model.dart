class ProductList{
  String? productName ;
  String? productId;
  String? tabletMg;
  String? soldBy;
  String? soldPic;
  double? amount;
  double? packSize;
  double? numberTablet;
  double? dosePack;
  String? constituent;
  String? dispenseIn;
  String? description;
  bool? liked;
  bool? isPrescribed;
  String? productImage;

  ProductList({this.productName,this.soldPic,this.productId,this.amount,this.description,this.liked,this.packSize,this.dosePack,this.numberTablet,this.tabletMg,this.constituent,this.dispenseIn,this.soldBy,this.productImage,this.isPrescribed = false});
}
