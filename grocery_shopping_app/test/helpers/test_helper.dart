import 'package:grocery_shopping_app/core/network/network_info.dart';
import 'package:grocery_shopping_app/feature/grocery/data/data_source/local_data_source.dart';
import 'package:grocery_shopping_app/feature/grocery/data/data_source/remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
   RemoteDataSource,
   LocalDataSource,
   NetworkInfo,

  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
