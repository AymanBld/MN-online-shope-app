class OrdersDetailsModel {
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
  int? cartPrContity;
  int? orderId;
  int? orderUser;
  String? orderPrice;
  int? orderCount;
  int? orderPayement;
  int? orderAddress;
  int? orderStatus;
  String? orderDate;
  int? addressId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLang;
  double? addressLat;
  int? addressUser;

  OrdersDetailsModel(
      {this.productId,
      this.productName,
      this.productNameAr,
      this.productDescription,
      this.productDescriptionAr,
      this.productImage,
      this.productPrice,
      this.productDiscount,
      this.productTime,
      this.productCategorie,
      this.productDiscountPrice,
      this.categorieId,
      this.categorieName,
      this.categorieNameAr,
      this.categorieImage,
      this.categorieTime,
      this.cartPrContity,
      this.orderId,
      this.orderUser,
      this.orderPrice,
      this.orderCount,
      this.orderPayement,
      this.orderAddress,
      this.orderStatus,
      this.orderDate,
      this.addressId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLang,
      this.addressLat,
      this.addressUser});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
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
    cartPrContity = json['cart_pr_contity'];
    orderId = json['order_id'];
    orderUser = json['order_user'];
    orderPrice = json['order_price'];
    orderCount = json['order_count'];
    orderPayement = json['order_payement'];
    orderAddress = json['order_address'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLang = json['address_lang'];
    addressLat = json['address_lat'];
    addressUser = json['address_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['cart_pr_contity'] = cartPrContity;
    data['order_id'] = orderId;
    data['order_user'] = orderUser;
    data['order_price'] = orderPrice;
    data['order_count'] = orderCount;
    data['order_payement'] = orderPayement;
    data['order_address'] = orderAddress;
    data['order_status'] = orderStatus;
    data['order_date'] = orderDate;
    data['address_id'] = addressId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lang'] = addressLang;
    data['address_lat'] = addressLat;
    data['address_user'] = addressUser;
    return data;
  }
}
