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

  //详情(基本) comicid
  static final String detailStatic = BASE_URL + "comic/detail_static_new";

  //详情(实时comicid
  static final String detailRealtime = BASE_URL + "comic/detail_realtime";

  //评论
  static final String commentList = BASE_URL + "comment/list";

  //章节内容
  static final String chapter = BASE_URL + "comic/chapterNew";
}
