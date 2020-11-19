class Api {
  ///
  static final String BASE_URL = "http://app.u17.com/v3/appV3_3/ios/phone/";

//搜索热门
  static final String searchHot = BASE_URL + "banner/json";

  //相关搜索
  static final String searchRelative = BASE_URL + "search/relative";

  //搜索结果
  static final String searchResult = BASE_URL + "comic/boutiqueListNew";

  //推荐列表
  // static final String boutiqueList = BASE_URL + "comic/boutiqueListNew";
  static final String boutiqueList = BASE_URL + "comic/getDetectListV4_5";

  //首页 小说
  static final String homeNovel = BASE_URL + "novel/recommend/getNovelRecommendList";


  //专题
  static final String special = BASE_URL + "comic/special";

  //VIP列表
  static final String vipList = BASE_URL + "list/vipList";

  //订阅列表
  static final String subscribeList = BASE_URL + "list/newSubscribeList";

  //排行列表
  static final String rankList = BASE_URL + "article/list/";

  //分类列表
  static final String cateList = BASE_URL + "sort/mobileCateList";

  //漫画列表
  static final String comicList = BASE_URL + "list/commonComicList";

  //猜你喜欢
  static final String guessLike = BASE_URL + "comic/guessLike";

  //详情(基本)
  static final String detailStatic = BASE_URL + "comic/detail_static_new";

  //详情(实时
  static final String detailRealtime = BASE_URL + "comic/detail_realtime";

  //评论
  static final String commentList = BASE_URL + "comment/list";

  //章节内容
  static final String chapter = BASE_URL + "comic/chapterNew";
}

///参数结构
/*
   var method: Moya.Method { return .get }
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .searchRelative(let inputText):
            parmeters["inputText"] = inputText

        case .searchResult(let argCon, let q):
            parmeters["argCon"] = argCon
            parmeters["q"] = q

        case .boutiqueList(let sexType):
            parmeters["sexType"] = sexType

        case .special(let argCon,let page):
            parmeters["argCon"] = argCon
            parmeters["page"] = max(1, page)

        case .comicList(let argCon, let argName, let argValue, let page):
            parmeters["argCon"] = argCon
            if argName.count > 0 { parmeters["argName"] = argName }
            parmeters["argValue"] = argValue
            parmeters["page"] = max(1, page)

        case .detailStatic(let comicid),
             .detailRealtime(let comicid):
            parmeters["comicid"] = comicid

        case .commentList(let object_id, let thread_id, let page):
            parmeters["object_id"] = object_id
            parmeters["thread_id"] = thread_id
            parmeters["page"] = page

        case .chapter(let chapter_id):
            parmeters["chapter_id"] = chapter_id

        default: break
        }
        */
