class RequestParams{

  var pathParams = new Map<String, String>();

  void addPathParam(String name, String value){
    pathParams[name] = value;
  }
}