//import 'dart:convert';
//import 'dart:io';
//
//import 'package:common_utils/common_utils.dart';
//import 'package:dio/dio.dart';
//import 'package:hshc_flutter_module/constant/constant.dart';
//import 'package:hshc_flutter_module/model/inner_response.dart';
//import 'package:hshc_flutter_module/utils/log_util.dart';
//
//import '../protocol/base_resp.dart';
//
///**
// * @Author: thl
// * @GitHub: https://github.com/Sky24n
// * @JianShu: https://www.jianshu.com/u/cbf2ad25d33a
// * @Email: 863764940@qq.com
// * @Description: Dio Util.
// * @Date: 2018/12/19
// */
//
///// 请求方法.
//class Method {
//  static final String get = "GET";
//  static final String post = "POST";
//  static final String put = "PUT";
//  static final String head = "HEAD";
//  static final String delete = "DELETE";
//  static final String patch = "PATCH";
//}
//
/////Http配置.
//class HttpConfig {
//  /// constructor.
//  HttpConfig({
//    this.status,
//    this.code,
//    this.msg,
//    this.data,
//    this.options,
//    this.pem,
//    this.pKCSPath,
//    this.pKCSPwd,
//  });
//
//  /// BaseResp [String status]字段 key, 默认：status.
//  String status;
//
//  /// BaseResp [int code]字段 key, 默认：errorCode.
//  String code;
//
//  /// BaseResp [String msg]字段 key, 默认：errorMsg.
//  String msg;
//
//  /// BaseResp [T data]字段 key, 默认：data.
//  String data;
//
//  /// Options.
//  Options options;
//
//  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
//  /// PEM证书内容.
//  String pem;
//
//  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
//  /// PKCS12 证书路径.
//  String pKCSPath;
//
//  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
//  /// PKCS12 证书密码.
//  String pKCSPwd;
//}
//
///// 单例 DioUtil.
///// debug模式下可以打印请求日志. DioUtil.openDebug().
///// dio详细使用请查看dio官网(https://github.com/flutterchina/dio).
//class DioUtil {
//  static final DioUtil _singleton = DioUtil._init();
//  static Dio _dio;
//
//  /// BaseResp [String status]字段 key, 默认：status.
//  String _contentKey = "content";
//
//  /// BaseResp [int code]字段 key, 默认：errorCode.
//  String _codeKey = "code";
//
//  /// BaseResp [String msg]字段 key, 默认：errorMsg.
//  String _msgKey = "msg";
//
//  /// Options.
//  BaseOptions _options = getDefOptions();
//
//  /// PEM证书内容.
//  String _pem;
//
//  /// PKCS12 证书路径.
//  String _pKCSPath;
//
//  /// PKCS12 证书密码.
//  String _pKCSPwd;
//
//  /// 是否是debug模式.
//  static bool _isDebug = true;
//
//  static DioUtil getInstance() {
//    return _singleton;
//  }
//
//  factory DioUtil() {
//    return _singleton;
//  }
//
//  DioUtil._init() {
//    _dio = new Dio(_options);
//  }
//
//  /// 打开debug模式.
//  static void openDebug() {
//    _isDebug = true;
//  }
//
//  void setCookie(String cookie) {
//    Map<String, dynamic> _headers = new Map();
//    _headers["Cookie"] = cookie;
//    _dio.options.headers.addAll(_headers);
//  }
//
//  /// Make http request with options.
//  /// [method] The request method.
//  /// [path] The url path.
//  /// [data] The request data
//  /// [options] The request options.
//  /// <BaseResp<T> 返回 status code msg data .
//  Future<InnerResponse> request<T>(String path, Map<String, Object> map,
//      {Options options,
//      CancelToken cancelToken,
//      String method,
//      bool isContentTypeJson}) async {
//
//    Response response;
//
//    response = await _dio.request(path,
//        options: _checkOptions(method == null ? Method.post : method, options,isContentTypeJson: isContentTypeJson),
//        cancelToken: cancelToken,
//        data: map,
//        queryParameters:  _getQueryParameterByRequestMethod(method,map));
//
//    _printHttpLog(response);
//    if (response.statusCode == HttpStatus.ok ||
//        response.statusCode == HttpStatus.created) {
//      try {
//        if (response.data is Map) {
//          return InnerResponse.fromJson(response.data);
//        } else {
//          Map<String, dynamic> _dataMap = _decodeData(response);
//          return InnerResponse.fromJson(_dataMap);
//        }
//      } catch (e) {
//        return new Future.error(new DioError(
//          response: response,
////          message: "data parsing exception...",
//          type: DioErrorType.RESPONSE,
//        ));
//      }
//    }
//    return new Future.error(new DioError(
//      response: response,
////      message: "statusCode: $response.statusCode, service error",
//      type: DioErrorType.RESPONSE,
//    ));
//  }
//
//  Map<String,Object> _getQueryParameterByRequestMethod(String method,Map<String,Object> map){
//    if(method == null || method == Method.post){
//      return Map();
//    }else{
//      return map;
//    }
//  }
//  /// Download the file and save it in local. The default http method is "GET",you can custom it by [Options.method].
//  /// [urlPath]: The file url.
//  /// [savePath]: The path to save the downloading file later.
//  /// [onProgress]: The callback to listen downloading progress.please refer to [OnDownloadProgress].
////  Future<Response> download(
////      String urlPath,
////      savePath, {
////        OnDownloadProgress onProgress,
////        CancelToken cancelToken,
////        data,
////        Options options,
////      }) {
////    return _dio.download(urlPath, savePath,
////        onProgress: onProgress,
////        cancelToken: cancelToken,
////        data: data,
////        options: options);
////  }
//
//  /// decode response data.
//  Map<String, dynamic> _decodeData(Response response) {
//    if (response == null ||
//        response.data == null ||
//        response.data.toString().isEmpty) {
//      return new Map();
//    }
//    return json.decode(response.data.toString());
//  }
//
//  /// check Options.
//  Options _checkOptions(method, options,{bool isContentTypeJson}) {
//    if (options == null) {
//      if(isContentTypeJson != null){
//        if(isContentTypeJson){
//          options = new Options(contentType: "application/json;charset=UTF-8");
//        }else{
//          options = new Options(contentType: "application/x-www-form-urlencoded");
//        }
//      }else{
//        options = new Options(contentType: "application/x-www-form-urlencoded");
//      }
//    }
//    Map<String,dynamic> map = Map();
//    map["token"] = Constant.sUserToken;
//    map["tokentype"] = "app";
//    options.headers = (new Map<String,dynamic>.from(options.headers))..addAll(map);
//    options.method = method;
//    return options;
//  }
//
//  /// merge Option.
//  void _mergeOption(Options opt) {
//    _options.method = opt.method ?? _options.method;
//    _options.headers = (new Map.from(_options.headers))..addAll(opt.headers);
////    _options.connectTimeout = opt.connectTimeout ?? _options.connectTimeout;
//    _options.receiveTimeout = opt.receiveTimeout ?? _options.receiveTimeout;
//    _options.responseType = opt.responseType ?? _options.responseType;
//    _options.extra = (new Map.from(_options.extra))..addAll(opt.extra);
//    _options.contentType = opt.contentType ?? _options.contentType;
//    _options.validateStatus = opt.validateStatus ?? _options.validateStatus;
//    _options.followRedirects = opt.followRedirects ?? _options.followRedirects;
//  }
//
//  /// print Http Log.
//  void _printHttpLog(Response response) {
//    if (!_isDebug) {
//      return;
//    }
//    try {
//      Log.info("----------------Http Log----------------" +
//          "\n[statusCode]:   " +
//          response.statusCode.toString() +
//          "\n[request   ]:   " +
//          _getOptionsStr(response.request));
//      _printDataStr("reqdata ", response.request.data);
//      _printDataStr("response", response.data);
//    } catch (ex) {
//      Log.info("Http Log" + " error......");
//    }
//  }
//
//  /// get Options Str.
//  String _getOptionsStr(RequestOptions request) {
//    return "method: " +
//        request.method +
//        "  url: " +
//        request.path ;
//  }
//
//  /// print Data Str.
//  void _printDataStr(String tag, Object value) {
//    String da = value.toString();
//    while (da.isNotEmpty) {
//      if (da.length > 512) {
//        Log.info("[$tag  ]:   " + da.substring(0, 512));
//        da = da.substring(512, da.length);
//      } else {
//        Log.info("[$tag  ]:   " + da);
//        da = "";
//      }
//    }
//  }
//
//  /// get dio.
//  Dio getDio() {
//    return _dio;
//  }
//
//  /// create new dio.
//  static Dio createNewDio([BaseOptions options]) {
//    options = options ?? getDefOptions();
//    Dio dio = new Dio(options);
//    return dio;
//  }
//
//  /// get Def Options.
//  static BaseOptions getDefOptions() {
//    BaseOptions options = new BaseOptions(
//      baseUrl: "",
//    );
////    options.contentType =
////        "application/x-www-form-urlencoded";
//    options.connectTimeout = 1000 * 10;
//    options.receiveTimeout = 1000 * 10;
//    return options;
//  }
//}
