class AddressModel {
  int? addressId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLang;
  double? addressLat;
  int? addressUser;

  AddressModel({
    this.addressId,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLang,
    this.addressLat,
    this.addressUser,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
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
