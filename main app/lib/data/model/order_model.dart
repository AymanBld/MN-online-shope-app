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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_user'] = this.orderUser;
    data['order_price'] = this.orderPrice;
    data['order_count'] = this.orderCount;
    data['order_payement'] = this.orderPayement;
    data['order_address'] = this.orderAddress;
    data['order_status'] = this.orderStatus;
    data['order_date'] = this.orderDate;
    data['address_name'] = this.addressName;
    return data;
  }
}
