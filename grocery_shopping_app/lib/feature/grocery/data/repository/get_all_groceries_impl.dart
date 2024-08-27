import 'package:dartz/dartz.dart';
import 'package:grocery_shopping_app/core/Error/failure.dart';
import 'package:grocery_shopping_app/core/network/network_info.dart';
import 'package:grocery_shopping_app/feature/grocery/data/data_source/local_data_source.dart';
import 'package:grocery_shopping_app/feature/grocery/data/data_source/remote_data_source.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/repository/get_all_groceries_repository.dart';

class GetAllGroceriesRepositoryImpl implements GetAllGroceriesRepository{
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetAllGroceriesRepositoryImpl({required this.localDataSource, 
                      required this.remoteDataSource, 
                      required this.networkInfo});

  @override
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries() async{
    // TODO: implement getAllGroceries
    final network = await networkInfo.isConnected;
    if (network) {
      try{
      final remoteGroceriesModelList = await remoteDataSource.getAllGroceries();
      final remoteGroceriesEntityList = remoteGroceriesModelList.map((e) => e.toEntity()).toList();

      //localDataSource.cacheGroceries(remoteGroceriesModelList);
      return Right(remoteGroceriesEntityList);}
      on Exception{
        return Left(ServerFailure());
      }
    
    } else {


      try{
      final localGroceriesModelList = await localDataSource.getAllGroceries();
      final localGroceriesEntityList = localGroceriesModelList.map((e) => e.toEntity()).toList();

      return Right(localGroceriesEntityList);}
      on Exception{
        return Left(CacheFailure());
      }
    }
  }
}