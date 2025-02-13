
*** request_client使用细节***

``bot_toast``配合 ``request_client``处理错误提示

*** request_client初始化***

``` dart
RequestConfig(baseUrl: "your base url");
RequestClient.init(config: RequestConfig.instance);

```

***注意配置``BotToastInit``***
````dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
````

*** request_client 其他配置参数 ***

```dart
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
```
***request_client修改配置***
```dart
RequestConfig.instance.successCode = 0;
RequestConfig.instance.dataKey = "data";
RequestConfig.instance.codeKey = "code";
RequestConfig.instance.messageKey = "msg";
RequestClient.init(config: RequestConfig.instance);
```

*** example ***
```dart
import 'package:request_client/request_client.dart';
var res = await RequestClient.instance.request("/path", method: RequestType.POST,data: {"email": "email"});
```