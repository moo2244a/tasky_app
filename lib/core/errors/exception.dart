class DataBaseExceptionSql implements Exception {
  final String massage;
  DataBaseExceptionSql(this.massage);
}

class SyntaxException implements Exception {
  final String massage;
  SyntaxException(this.massage);
}
