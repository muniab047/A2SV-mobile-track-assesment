import 'package:dartz/dartz.dart';
import 'package:grocery_shopping_app/core/Error/failure.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';

abstract class GetAllGroceriesRepository {
   Future<Either<Failure,List<GroceryEntity>>> getAllGroceries();
}