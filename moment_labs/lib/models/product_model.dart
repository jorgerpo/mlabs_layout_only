import 'dart:convert';

import 'package:flutter/cupertino.dart';

class ProductModel {
  int id;
  String name;
  String description;
  String price;
  String longDescription;
  String imageLocation;
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.longDescription,
    this.imageLocation,
  });

  ProductModel copyWith({
    int id,
    String name,
    String description,
    String price,
    String longDescription,
    String imageLocation,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      longDescription: longDescription ?? this.longDescription,
      imageLocation: imageLocation ?? this.imageLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'longDescription': longDescription,
      'imageLocation': imageLocation,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      longDescription: map['longDescription'],
      imageLocation: map['imageLocation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, price: $price, longDescription: $longDescription, imageLocation: $imageLocation)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProductModel &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.price == price &&
        o.longDescription == longDescription &&
        o.imageLocation == imageLocation;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        longDescription.hashCode ^
        imageLocation.hashCode;
  }
}
