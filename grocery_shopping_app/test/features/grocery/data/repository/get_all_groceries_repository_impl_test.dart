import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping_app/core/Error/failure.dart';
import 'package:grocery_shopping_app/core/network/network_info.dart';
import 'package:grocery_shopping_app/feature/grocery/data/data_source/local_data_source.dart';
import 'package:grocery_shopping_app/feature/grocery/data/data_source/remote_data_source.dart';
import 'package:grocery_shopping_app/feature/grocery/data/model/grocery_model.dart';
import 'package:grocery_shopping_app/feature/grocery/data/repository/get_all_groceries_impl.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/entity/grocery.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/repository/get_all_groceries_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:collection/collection.dart';

import '../../../../helpers/test_helper.mocks.dart';



void main() {
  late GetAllGroceriesRepositoryImpl repository;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = GetAllGroceriesRepositoryImpl(
      localDataSource: mockLocalDataSource,
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final List<GroceryModel> tGroceryModelList = [
    GroceryModel(
      id: '1',
      title: 'Milk',
      image: 'milk.jpg',
      description: 'Fresh milk',
      price: 1.5,
      discount: 0.0,
      options: [],
      rating: 4.9,
    )
  ];
  
  final List<GroceryEntity> tGroceryEntityList = tGroceryModelList.map((e) => e.toEntity()).toList();

  test('should check if the device is online', () async {
    // Arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    when(mockRemoteDataSource.getAllGroceries()).thenAnswer((_) async => tGroceryModelList);

    // Act
    repository.getAllGroceries();

    // Assert
    verify(mockNetworkInfo.isConnected);
  });

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test('should return remote data when the call to remote data source is successful', () async {
      // Arrange
      when(mockRemoteDataSource.getAllGroceries()).thenAnswer((_) async => tGroceryModelList);

      // Act
      final result = await repository.getAllGroceries();

      // Assert
      verify(mockRemoteDataSource.getAllGroceries());
       final listEquality = ListEquality();

      expect(listEquality.equals(result.getOrElse(()=>[]), tGroceryEntityList), isTrue);
 
    });

    test('should return server failure when the call to remote data source is unsuccessful', () async {
      // Arrange
      when(mockRemoteDataSource.getAllGroceries()).thenThrow(Exception());

      // Act
      final result = await repository.getAllGroceries();

      // Assert
      verify(mockRemoteDataSource.getAllGroceries());
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group('device is offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test('should return local data when the cached data is present', () async {
      // Arrange
      when(mockLocalDataSource.getAllGroceries()).thenAnswer((_) async => tGroceryModelList);

      // Act
      final result = await repository.getAllGroceries();

      // Assert
      verify(mockLocalDataSource.getAllGroceries());
      
      final listEquality = ListEquality();
      expect(listEquality.equals(result.getOrElse(()=>[]), tGroceryEntityList), isTrue);
    });

    test('should return CacheFailure when there is no cached data present', () async {
      // Arrange
      when(mockLocalDataSource.getAllGroceries()).thenThrow(Exception());

      // Act
      final result = await repository.getAllGroceries();

      // Assert
      verify(mockLocalDataSource.getAllGroceries());
      expect(result, equals(Left(CacheFailure())));
    });
  });
}
