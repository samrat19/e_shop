class ErrorException{
  static final ErrorException _singleton = ErrorException._internal();

  factory ErrorException()  => _singleton;

  ErrorException._internal();


  String getException(int? statusCode){
    if(statusCode! == 401){
      return 'Unauthenticated';
    }else if(statusCode == 500){
      return 'Can not reach to server';
    }else{
      return "Something went wrong";
    }
  }
}