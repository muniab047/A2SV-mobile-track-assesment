import 'package:dartz/dartz.dart';
import 'package:grocery_shopping_app/feature/grocery/data/model/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<GroceryModel>> getAllGroceries();
  Future<Unit> cacheGroceries(List<GroceryModel> groceries);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<List<GroceryModel>> getAllGroceries() {
    throw UnimplementedError();
  }
  
  @override
  Future<Unit> cacheGroceries(List<GroceryModel> groceries) {
    // TODO: implement cacheGroceries
    throw UnimplementedError();
  }}