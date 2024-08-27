import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/data/model/grocery_model.dart';

void main() {
  group('GroceryModel', () {
    final jsonData = {
      "id": "66be460f71fccd1506882d24",
      "title": "Chicken Burger",
      "image": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg",
      "rating": 4.9,
      "price": 11,
      "discount": 6,
      "description": "A delicious chicken burger served on a toasted bun with fresh lettuce, tomato slices, and mayonnaise. Juicy grilled chicken patty seasoned to perfection for a mouthwatering taste experience.",
      "options": [
        {
          "id": "66be474571fccd1506882d26",
          "name": "Add Cheese",
          "price": 0.5
        },
        {
          "id": "66be479671fccd1506882d28",
          "name": "Add Bacon",
          "price": 1
        },
        {
          "id": "66be47c671fccd1506882d29",
          "name": "Add Meat",
          "price": 0
        }
      ]
    };

    final groceryModel = GroceryModel(
      id: "66be460f71fccd1506882d24",
      title: "Chicken Burger",
      image: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg",
      description: "A delicious chicken burger served on a toasted bun with fresh lettuce, tomato slices, and mayonnaise. Juicy grilled chicken patty seasoned to perfection for a mouthwatering taste experience.",
      price: 11,
      discount: 6,
      rating: 4.9,
      options: [
        Options(id: "66be474571fccd1506882d26", name: "Add Cheese", price: 0.5),
        Options(id: "66be479671fccd1506882d28", name: "Add Bacon", price: 1),
        Options(id: "66be47c671fccd1506882d29", name: "Add Meat", price: 0),
      ],
    );

    test('should convert JSON to GroceryModel', () {
      final result = GroceryModel.fromJson(jsonData);
     // expect(result, isA<GroceryModel>());
      expect(result.id, groceryModel.id);
      expect(result.title, groceryModel.title);
      expect(result.image, groceryModel.image);
      expect(result.description, groceryModel.description);
      expect(result.price, groceryModel.price);
      expect(result.discount, groceryModel.discount);
      expect(result.options.length, groceryModel.options.length);
    });

    test('should convert GroceryModel to JSON', () {
      final result = groceryModel.toJson();
      expect(result, isA<Map<String, dynamic>>());
      expect(result['id'], jsonData['id']);
      expect(result['title'], jsonData['title']);
      expect(result['image'], jsonData['image']);
      expect(result['description'], jsonData['description']);
      expect(result['price'], jsonData['price']);
      expect(result['discount'], jsonData['discount']);
     // expect(result['options'].length, jsonData['options'].length);
    });

    test('should convert GroceryModel to GroceryEntity', () {
      final entity = groceryModel.toEntity();
      expect(entity, isA<GroceryEntity>());
      expect(entity.id, groceryModel.id);
      expect(entity.title, groceryModel.title);
      expect(entity.image, groceryModel.image);
      expect(entity.description, groceryModel.description);
      expect(entity.price, groceryModel.price);
      expect(entity.discount, groceryModel.discount);
      //expect(entity.options.length, groceryModel.options.length);
    });

    test('should be a subclass of GroceryEntity', () {
      // Verify if GroceryModel is also a GroceryEntity
      expect(groceryModel, isA<GroceryEntity>());
    });
  });
}
