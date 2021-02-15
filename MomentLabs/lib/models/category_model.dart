import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class CategoryModel {
  String name;
  Color color;
  String description;
  CategoryModel({
    this.name,
    this.color,
    this.description,
  });

  CategoryModel copyWith({
    String name,
    Color color,
    String description,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      color: color ?? this.color,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'color': color?.value,
      'description': description,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryModel(
      name: map['name'],
      color: Color(map['color']),
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoryModel(name: $name, color: $color, description: $description)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryModel &&
        o.name == name &&
        o.color == color &&
        o.description == description;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode ^ description.hashCode;
}
