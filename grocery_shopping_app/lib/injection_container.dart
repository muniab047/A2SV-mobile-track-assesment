import 'package:get_it/get_it.dart';
import 'package:grocery_shopping_app/feature/grocery/domain/repository/get_all_groceries_repository.dart';
import 'package:grocery_shopping_app/feature/grocery/presentation/bloc/grocery_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'feature/grocery/data/data_source/local_data_source.dart';
import 'feature/grocery/data/data_source/remote_data_source.dart';
import 'feature/grocery/data/repository/get_all_groceries_impl.dart';
import 'feature/grocery/domain/use_case/get_all_groceries.dart';

final sl = GetIt.instance;



Future<void> init() async{

  sl.registerFactory(()=> GroceryBloc(sl()));
  
  sl.registerLazySingleton(() => GetAllGroceriesUseCase(repository: sl()));

  sl.registerLazySingleton<GetAllGroceriesRepository>(() => GetAllGroceriesRepositoryImpl(localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: sl()));


  //! Core 

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
 


  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());



}