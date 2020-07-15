import 'package:dio/dio.dart';
import 'package:github_demo/common/global.dart';

class CreateDio {
  Dio _dio;

  BaseOptions _options = BaseOptions(
      baseUrl: Global.domain,
      connectTimeout: 10000,
      receiveTimeout: 3000,
      contentType: Headers.formUrlEncodedContentType);

  // dio命名构造函数
  CreateDio.init() {
    _dio = new Dio(_options);

    initInterceptors();
  }

  // 拦截器
  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
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
        print('aaaaaaaaaaaaaaaaaaa');
      },
    ));
  }
}

void main() async {
  try {
    await dio.get('/asd');
  } catch (e) {
    print('------------------');
    print(e);
  }
}
