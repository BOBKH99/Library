class AppEception implements Exception{
  final _message;
  final _prefix;

  AppEception([this._message, this._prefix]);

  @override
  String toString() {
    return 'AppEception { _prefix : $_prefix, _message : $_message,}';
  }
}
class FetchDataExeption extends AppEception{
  FetchDataExeption(String message)
  : super('error during communication', message);
}
class BadRequestEception extends AppEception{
  BadRequestEception(String message)
  : super('Your request model is not right', message);
}