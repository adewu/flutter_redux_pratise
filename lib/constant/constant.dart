/// 创建时间：2019-12-27
/// 作者：wuxm
/// 描述： 全局参数

enum ApiEnv {
  DEV,
  PROD,
}

class Constant {
  static ApiEnv sCurrentEnv = ApiEnv.DEV;

  ///flutter工程需要调用原生插件获取结果开关
  static bool sIsNeedMockData = false;


  static String sUserToken = "21de8769db36578a20c6852bf6e0e17a";


  static String getUrlPreFix() {
//    if(sCurrentEnv == edv)
  }
}
