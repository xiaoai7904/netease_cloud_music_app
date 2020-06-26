class Api {
  static final String baseUrl = 'http://192.168.1.199:3000';
  // 以下接口不需要登录⬇
  // 获取发现页面banner数据
  // 参数: { type: 0<pc> | 1<android> | 2<iphone> | 3<ipad> }
  static final String banner = '/banner';
  // 获取推荐歌单
  // 参数: {limit: 30<取出数量, 默认为 30 (不支持 offset)>}
  static final String personalized = '/personalized';
  // 获取推荐音乐
  // 参数: {}
  static final String personalizedNewSong = '/personalized/newsong';
  // 获取推荐电台
  // 参数: {}
  static final String personalizedDjprogram = '/personalized/djprogram';
  // 获取独家推送
  // 参数: {}
  static final String personalizedPrivatecontent = '/personalized/privatecontent';
  // 获取对应歌单
  // 参数: {order: 'new' | 'hot', limit: 50<每页显示条数>, offset: 1<当前页>, cat: '全部' | '华语' | '流行'</playlist/catlist接口获取>}
  static final String topPlayList = '/top/playlist';
  // 全部歌单分类 -> 华语 流行 民谣等
  // 参数: {}
  static final String catlist = '/playlist/catlist';
  // 热门歌单分类 -> 华语 流行 民谣等
  // 参数: {}
  static final String playlistHot = '/playlist/hot';
  // 获取精品歌单
  // 参数: {limit: 20<歌单数量>, before: ''<分页参数,取上一页最后一个歌单的 updateTime 获取下一页数据>}
  static final String topPlayListHighquality = '/top/playlist/highquality';
}