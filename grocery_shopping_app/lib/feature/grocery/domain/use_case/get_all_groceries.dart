import 'package:dartz/dartz.dart';
import 'package:grocery_shopping_app/core/Error/failure.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/repository/get_all_groceries_repository.dart';

class GetAllGroceriesUseCase {
  final GetAllGroceriesRepository repository;

  GetAllGroceriesUseCase({required this.repository});

  Future<Either<Failure,List<GroceryEntity>>> call() async {
    return await repository.getAllGroceries();
  }
}