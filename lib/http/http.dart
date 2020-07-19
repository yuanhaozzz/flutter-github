import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_demo/common/global.dart';

class CreateHttp {
  Dio dio;

  BaseOptions _options = BaseOptions(
    baseUrl: Global.domain,
    connectTimeout: 10000,
    receiveTimeout: 3000,
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  );

  // dio命名构造函数
  CreateHttp.init() {
    dio = new Dio(_options);
    dio.options.headers[HttpHeaders.authorizationHeader] =
        Global.profile['token'];
    initInterceptors();
  }

  // 拦截器
  void initInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      // 拦截请求
      onRequest: (RequestOptions options) {
        print(options.baseUrl + options.path);
        print('=====================');
      },
      // 拦截响应
      onResponse: (Response response) {},
      // 异常捕获
      onError: (e) {
        print(e.error);
        print('---------------------');
      },
    ));
  }

  Future requestGet(String url, Map<dynamic, dynamic> queryParameters) {
    return dio.get(url, queryParameters: queryParameters);
  }
}
