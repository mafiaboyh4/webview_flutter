import 'package:cubitexample/core/constants.dart';
import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethod(String url) async {
      BaseOptions options = BaseOptions(
        baseUrl: Constants.apiBaseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Constants.dioConnectionTimeOut,
        receiveTimeout: Constants.dioConnectionTimeOut,
        sendTimeout: Constants.dioConnectionTimeOut,
    );

    Dio dio = Dio(options);

    return await dio
        .get(url,
            options: Options(
              responseType: ResponseType.json,
              method: "GET"
            ))
        .then((response) {
      return response;
    });
  }
}
