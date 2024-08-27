import 'package:equatable/equatable.dart';


class GroceryEntity extends Equatable{
  final String id, title, image, description;
  final double price, discount, rating;
  final List<Options> options ;

  GroceryEntity({required this.id, 
                required this.title, 
                required this.image, 
                required this.description, 
                required this.price, 
                required this.discount, 
                required this.options,
                required this.rating
                });
                
  @override
  // TODO: implement props
  List<Object?> get props => [id, title, image, description, price, discount, options, rating];


}




class Options extends Equatable{
  final String id, name;
  final double price;

  Options({required this.id, required this.name, required this.price});

  factory Options.fromJson(Map<String, dynamic> json) {
    return Options(
      id: json['id'].toString(),
      name: json['name'].toString(),
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price
    };
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, price];

}