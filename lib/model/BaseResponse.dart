class BaseResponse{

  String errorCode;
  String errorMessage;

  BaseResponse.name(this.errorCode, this.errorMessage);

  bool isError(){
    return errorMessage!=null && errorMessage!='';
  }
}