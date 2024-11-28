class ProductModel {
  int? productId;
  String? productName;
  String? productNameAr;
  String? productDescription;
  String? productDescriptionAr;
  String? productImage;
  String? productPrice;
  int? productDiscount;
  String? productTime;
  int? productCategorie;
  String? productDiscountPrice;
  int? categorieId;
  String? categorieName;
  String? categorieNameAr;
  String? categorieImage;
  String? categorieTime;
  int? isfavorite;
  int? cartPrContity;

  ProductModel({
    productId,
    productName,
    productNameAr,
    productDescription,
    productDescriptionAr,
    productImage,
    productPrice,
    productDiscount,
    productTime,
    productCategorie,
    productDiscountPrice,
    categorieId,
    categorieName,
    categorieNameAr,
    categorieImage,
    categorieTime,
    isfavorite,
    cartPrContity,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDescription = json['product_description'];
    productDescriptionAr = json['product_description_ar'];
    productImage = json['product_image'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    productTime = json['product_time'];
    productCategorie = json['product_categorie'];
    productDiscountPrice = json['product_discount_price'];
    categorieId = json['categorie_id'];
    categorieName = json['categorie_name'];
    categorieNameAr = json['categorie_name_ar'];
    categorieImage = json['categorie_image'];
    categorieTime = json['categorie_time'];
    isfavorite = json['isfavorite'];
    cartPrContity = json['cart_pr_contity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_ar'] = productNameAr;
    data['product_description'] = productDescription;
    data['product_description_ar'] = productDescriptionAr;
    data['product_image'] = productImage;
    data['product_price'] = productPrice;
    data['product_discount'] = productDiscount;
    data['product_time'] = productTime;
    data['product_categorie'] = productCategorie;
    data['product_discount_price'] = productDiscountPrice;
    data['categorie_id'] = categorieId;
    data['categorie_name'] = categorieName;
    data['categorie_name_ar'] = categorieNameAr;
    data['categorie_image'] = categorieImage;
    data['categorie_time'] = categorieTime;
    data['isfavorite'] = isfavorite;
    data['cart_pr_contity'] = cartPrContity;
    return data;
  }
}
