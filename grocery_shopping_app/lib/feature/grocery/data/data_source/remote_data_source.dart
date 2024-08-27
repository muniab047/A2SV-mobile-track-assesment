import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:grocery_shopping_app/core/Error/exception.dart';
import 'package:grocery_shopping_app/core/const/constants.dart';
import 'package:grocery_shopping_app/feature/grocery/data/model/grocery_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<GroceryModel>> getAllGroceries();
  
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<GroceryModel>> getAllGroceries()async{
    final url = URL;
    final header = {
      "Content-Type": "application/json",
    };

    final response = await client.get(Uri.parse(url), headers: header);

    if (response.statusCode == 200){
      final groceriesJson = json.decode(response.body);
       final List<GroceryModel> groceriesModelList = List<GroceryModel>.from(
      groceriesJson['data'].map((groceryJson) => GroceryModel.fromJson(groceryJson)),
    );
      return groceriesModelList;
    } else {
      throw ServerException();
    }
  }


}