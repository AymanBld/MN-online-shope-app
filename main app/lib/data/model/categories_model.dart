class CategoriesModel {
  int? categorieId;
  String? categorieName;
  String? categorieNameAr;
  String? categorieImage;
  String? categorieTime;

  CategoriesModel(
      {this.categorieId,
      this.categorieName,
      this.categorieNameAr,
      this.categorieImage,
      this.categorieTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categorieId = json['categorie_id'];
    categorieName = json['categorie_name'];
    categorieNameAr = json['categorie_name_ar'];
    categorieImage = json['categorie_image'];
    categorieTime = json['categorie_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categorie_id'] = categorieId;
    data['categorie_name'] = categorieName;
    data['categorie_name_ar'] = categorieNameAr;
    data['categorie_image'] = categorieImage;
    data['categorie_time'] = categorieTime;
    return data;
  }
}
