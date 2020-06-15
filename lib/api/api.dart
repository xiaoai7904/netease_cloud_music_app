class Api {
  static final String baseUrl = 'http://192.168.1.199:3000';
  // 以下接口不需要登录⬇
  // 获取发现页面banner数据
  // 参数: { type: 0: pc 1: android2: iphone 3: ipad }
  static final String banner = '/banner';
  // 获取推荐歌单
  // 参数: {limit: 取出数量, 默认为 30 (不支持 offset)}
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
}