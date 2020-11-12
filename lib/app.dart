import 'package:fish_redux/fish_redux.dart' ;
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux_pratise/app_configuration.dart';
import 'package:flutter_redux_pratise/global_store/state.dart';
import 'package:flutter_redux_pratise/global_store/store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';


import 'constant/constant.dart';
import 'constant/page_route_name.dart';
import 'generated/i18n.dart';


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({

      PageRouteName.MAIN : (pageName, params, _) => filterGlobalSetting(PageRouteName.MAIN, params),


    });
  }

  filterGlobalSetting(String routeName,Map<dynamic, dynamic> params){
//    AppConfiguration.setConstantAndUrls(routeName, params);
    return routes.buildPage(routeName, params);
  }


  final AbstractRoutes routes = PageRoutes(
    pages: AppConfiguration.sPages,
    visitor: (String path, Page<Object, dynamic> page) {
      /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
      /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
      if (page.isTypeof<GlobalBaseState>()) {
        /// 建立 AppStore 驱动 PageStore 的单向数据连接
        /// 1. 参数1 AppStore
        /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
        page.connectExtraStore<GlobalState>(GlobalStore.store,
                (Object pagestate, GlobalState appState) {
              final GlobalBaseState p = pagestate;
              if (p.themeColor != appState.themeColor) {
                if (pagestate is Cloneable) {
                  final Object copy = pagestate.clone();
                  final GlobalBaseState newState = copy;
                  newState.themeColor = appState.themeColor;
                  return newState;
                }
              }
              return pagestate;
            });
      }

      /// AOP
      /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
      /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: <EffectMiddleware<dynamic>>[
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );


  _judgeRoute(){
    Constant.routes = routes;
    if(Constant.sIsNeedMockData){
      return routes.buildPage(PageRouteName.MAIN, null);
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context,width: 1080,height: 1920,allowFontScaling: false);
    return OKToast(
      child: MaterialApp(
        title: 'Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale("zh", ""),
        ],
        locale: Locale('zh'),
        home: _judgeRoute(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute<Object>(builder: (BuildContext context) {
              return routes.buildPage(settings.name, settings.arguments);
          });
        },
      ),
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
  }
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
//          Log.info('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
