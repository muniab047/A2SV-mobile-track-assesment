import 'dart:ffi';

import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';

class GroceryModel extends GroceryEntity{
  GroceryModel({required super.id, 
               required super.title, 
               required super.image, 
               required super.description, 
               required super.price, 
               required super.discount, 
               required super.options,
               required super.rating,
               });

            

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return GroceryModel(
      id: json['id'].toString(),
      title: json['title'].toString(),
      image: json['imageUrl'].toString(),
      description: json['description'].toString(),
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      discount: json['discount'].toDouble(),
       options: (json['options'] as List<dynamic>).map((option) => Options.fromJson(option)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': image,
      'description': description,
      'price': price,
      'discount': discount,
      'rating': rating,
      'options': options.map((option)=> option.toJson()).toList(),
    };
  }

  GroceryEntity toEntity(){
    return GroceryEntity(
      id: id,
      title: title,
      image: image,
      description: description,
      price: price,
      discount: discount,
      options: options,
      rating: rating
    );
  }
}