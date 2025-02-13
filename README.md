<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

request_client combine dio with some intercept
## Usage

RequestConfig(baseUrl: "https://yun.simicloud.com:10443/iot1");
RequestConfig.instance.successCode = 0;
RequestClient.init(config: RequestConfig.instance);
String? baseUrl;
int connectTimeOut = 10; //请求超时
int writeTimeOut = 10;
int readTimeOut = 10;
int successCode = 200; //成功状态码
String dataKey = "data"; //数据key
String codeKey = "code"; //状态码key
String messageKey = "msg"; //消息key
List enableLoginCodes = []; //登陆实效的code集合
InterceptorRequestBack? requestCall; //请求拦截配置 设置token
InterceptorBack? loginOutCall; //token失效拦截器回调
TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
