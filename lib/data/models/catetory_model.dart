
import 'package:ecommerce/data/models/category.dart';

class CategoryModelData {
  String? msg;
  List<Category>? categoryData;

  CategoryModelData({this.msg, this.categoryData});

  CategoryModelData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryData = <Category>[];
      json['data'].forEach((v) {
        categoryData!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categoryData != null) {
      data['data'] = categoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

