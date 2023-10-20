import 'dart:convert';
import 'package:http/http.dart' as http;

enum HttpRequest {
  post,
  get,
  postAuth,
}

class HttpRepository {
  Future<dynamic> makeRequest(
      {HttpRequest? requestType,
      String? path,
      Map<String, dynamic>? bodyMap,
      List<String>? imagesPath,
      Map<String, dynamic>? params}) async {
    try {
      http.Response? request;
      // var token = await globalRef.read(secureStorageProvider).read(key: AppConstants.token);
      var newUrl = Uri.https("mai-jo.com", "/App/Customers_APIS/$path", params);
      print('------------------------------------$newUrl');
      String? body;
      if (bodyMap != null) {
        body = json.encode(bodyMap);
      }
      Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        // "token": token ?? "",
      };
      switch (requestType!) {
        case HttpRequest.get:
          request = await http.get(newUrl, headers: header);
          break;
        case HttpRequest.post:
          request = await http.post(newUrl, body: body, headers: header);
          break;
        case HttpRequest.postAuth:
          Map<String, String> authHeader = {
            'Content-type': 'application/json',
            'Accept': 'application/json',
          };
          request = await http.post(newUrl, body: body, headers: authHeader);
          break;
      }
      switch (request?.statusCode) {
        case 400:
        case 401:
          throw request!.body;
        case 500:
          throw request!.body;
        default:
      }
      return jsonDecode(request!.body);
    } catch (e) {
      print(e.toString());
      throw e.toString();
    }
  }
}
