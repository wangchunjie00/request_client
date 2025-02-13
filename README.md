
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
