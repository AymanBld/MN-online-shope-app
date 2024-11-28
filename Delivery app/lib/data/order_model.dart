class OrderModel {
  int? orderId;
  int? orderUser;
  String? orderPrice;
  int? orderCount;
  int? orderPayement;
  int? orderAddress;
  int? orderStatus;
  String? orderDate;
  String? addressName;

  OrderModel(
      {this.orderId,
      this.orderUser,
      this.orderPrice,
      this.orderCount,
      this.orderPayement,
      this.orderAddress,
      this.orderStatus,
      this.orderDate,
      this.addressName});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUser = json['order_user'];
    orderPrice = json['order_price'];
    orderCount = json['order_count'];
    orderPayement = json['order_payement'];
    orderAddress = json['order_address'];
    orderStatus = json['order_status'];
    orderDate = json['order_date'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_user'] = orderUser;
    data['order_price'] = orderPrice;
    data['order_count'] = orderCount;
    data['order_payement'] = orderPayement;
    data['order_address'] = orderAddress;
    data['order_status'] = orderStatus;
    data['order_date'] = orderDate;
    data['address_name'] = addressName;
    return data;
  }
}
