import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping_app/core/Error/exception.dart';
import 'package:grocery_shopping_app/core/const/constants.dart';
import 'package:grocery_shopping_app/feature/grocery/data/data_source/remote_data_source.dart';

import 'package:grocery_shopping_app/feature/grocery/data/model/grocery_model.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';


void main() {
  late RemoteDataSourceImpl remoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });

  group('getAllGroceries', () {
    final url = URL;
    final header = {
      "Content-Type": "application/json",
    };

    final groceryList = [
      GroceryModel(
        id: "66be460f71fccd1506882d24",
        title: "Chicken Burger",
        image: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg",
        description: "A delicious chicken burger served on a toasted bun with fresh lettuce, tomato slices, and mayonnaise.",
        price: 11.0,
        discount: 6.0,
        rating: 4.9,
        options: [
          Options(id: "66be474571fccd1506882d26", name: "Add Cheese", price: 0.5),
          Options(id: "66be479671fccd1506882d28", name: "Add Bacon", price: 1.0),
          Options(id: "66be47c671fccd1506882d29", name: "Add Meat", price: 0.0),
        ],
      ),
    ];

    final responseJson = {
      'data': groceryList.map((grocery) => grocery.toJson()).toList(),
    };

   test('should perform a GET request on the given URL with application/json header', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(url), headers: header))
          .thenAnswer((_) async => http.Response(json.encode(responseJson), 200));

      // Act
      await remoteDataSource.getAllGroceries();

      // Assert
      verify(mockHttpClient.get(Uri.parse(url), headers: header));
    });

    test('should return a list of GroceryModel when the response code is 200 (success)', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(url), headers: header))
          .thenAnswer((_) async => http.Response(json.encode(responseJson), 200));

      // Act
      final result = await remoteDataSource.getAllGroceries();

      // Assert
      expect(result, equals(groceryList));
    });

   test('should throw a ServerException when the response code is not 200', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(url), headers: header))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));

      // Act
      final call = remoteDataSource.getAllGroceries();

      // Assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
