abstract class Exception {

}

class ServerException extends Exception {
  final String message;
  ServerException({this.message = 'Server Failure'});
}

class CacheException extends Exception {
  final String message;
  CacheException({this.message = 'Cache Failure'});
}