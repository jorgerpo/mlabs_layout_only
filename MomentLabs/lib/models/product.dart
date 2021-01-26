class ProductModel {
  int id;
  String name;
  String description;
  String price;
  String longDescription;

  ProductModel({id, name, description, price, longDescription});

  ProductModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.description = json['description'];
    this.longDescription = json['longDescription'];
    this.price = json['price'];
    this.id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['longDescription'] = this.longDescription;
    data['price'] = this.price;
    return data;
  }
}
