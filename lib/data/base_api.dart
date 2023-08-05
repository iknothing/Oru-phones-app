abstract class BaseApi {
  Future getApiResponse(String url, context);

  Future postApiResponse(String url, dynamic data, context);

  Future deletApiResponse(String url, dynamic data, context);

  Future updateApiResponse(String url, dynamic data, context);

}
