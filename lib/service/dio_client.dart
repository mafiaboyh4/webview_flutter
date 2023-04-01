import 'package:cubitexample/core/constants.dart';
import 'package:cubitexample/service/auth_utils.dart';
import 'package:dio/dio.dart';

class DioClient {
  Dio _dio = Dio();

  static final DioClient _apiServiceManager = DioClient._internal();

  factory DioClient() {
    BaseOptions options = BaseOptions(
      baseUrl: Constants.apiBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Constants.dioConnectionTimeOut,
      receiveTimeout: Constants.dioConnectionTimeOut,
      sendTimeout: Constants.dioConnectionTimeOut,
    );
    _apiServiceManager._dio = Dio(options);
    return _apiServiceManager;
  }

  DioClient._internal();

  Future<Response> get(
    String path, {
    Map<String, String?>? query,
    bool useAuthorize = false,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 200));
    try {
      print("getRequest => : $path ");
      print(":BODY => : $query ");
      dynamic response = await _dio.get(
        path,
        queryParameters: query,
        options: _getRequestOptions(useAuthorize),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    bool useAuthorize = false,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 200));
    try {
      print("postRequest => : $path ");
      print(":BODY => : $body ");
      Response response = await _dio.post(
        path,
        data: body,
        options: _getRequestOptions(useAuthorize),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
    bool useAuthorize = false,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 200));
    try {
      print("putRequest => : $path ");
      Response response = await _dio.put(
        path,
        data: body,
        options: _getRequestOptions(useAuthorize),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Options? _getRequestOptions(bool useAuthorize) {
    if (!useAuthorize) return null;
    // print(getUserToken());
    return Options(
      headers: {
        "Authorization": "Bearer token",
      },
    );
  }
}


//  _checkResponse(Response resp, ReturnResponse returnResponse) async {
//     try {
//       final res = resp.data;

//       returnResponse.statusCode = resp.statusCode;

//       if (returnResponse.statusCode == 200) {
//         returnResponse.data = res['data'];
//         if (resp.data['pagination'] != null) {
//           returnResponse.pagination =
//               PaginationModel.fromJson(res['pagination']);
//         }
//       } else {
//         if (res["message"] != null) {
//           returnResponse.message = res["message"];
//         }
//       }
//     } catch (e) {
//       returnResponse.message = ApplicationMessages.unknownError;
//     }
//   }