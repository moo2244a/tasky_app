abstract class Failure {
  final String message;
  const Failure(this.message);
}

class InsertFailure extends Failure {
  InsertFailure(super.message);
}
