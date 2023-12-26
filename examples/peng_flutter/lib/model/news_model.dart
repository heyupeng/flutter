  /*
  "news_date": "2023-12-08 08:27:00",
  "date": "12月8日 08:27",
  "title": "墨菲轰生涯第8杆年内第2杆147 或独享单杆最高奖金",
  "wap_title": "墨菲轰生涯第8杆年内第2杆147 或独享单杆最高奖金",
  "img": "https://k.sinaimg.cn/n/sports/743/w1656h687/20231208/2ceb-61c23eecab8eacae76aca8d18604352d.png/w160h120l1t1cef.jpg",
  "type": "normal",
  "pics": { "total": 1 },
  "link": "https://sports.sina.cn/others/snooker/2023-12-08/detail-imzxhfwc7531001.d.html?pos=10",
  "comment_id": "ty:comos-mzxhfwc7531001:0:mzxhfwc7531001",
  "commentid": "ty:comos-mzxhfwc7531001:0:mzxhfwc7531001",
  "source": "新浪体育讯",
  "intro": "墨菲轰生涯第8杆年内第2杆147 或独享单杆最高奖金",
  "mediaTypes": "normal",
  "isSubject": 0,
  "isDujia": 0,
  "newsType": "no",
  "docID": "mzxhfwc7531001",
  "dataid": "comos:mzxhfwc7531001",
  "newsTag": "",
  "comment": 1
  */

class NewsModel {

  NewsModel({ required this.jsonObject });

  final jsonObject;
  
  String get news_date => jsonObject['news_date'] ?? '';
  String get date => jsonObject['date'] ?? '';
  String get title => jsonObject['title'] ?? '';
  String get wap_title => jsonObject['wap_title'] ?? '';
  String get img => jsonObject['img'] ?? '';
  String get type => jsonObject['type'] ?? '';
  String get pics => jsonObject['pics'] ?? '';

  String get link => jsonObject['link'] ?? '';
  String get comment_id => jsonObject['comment_id'] ?? '';
  String get commentid => jsonObject['commentid'] ?? '';
  String get source => jsonObject['source'] ?? '';
  String get intro => jsonObject['intro'] ?? '';
  String get mediaTypes => jsonObject['mediaTypes'] ?? '';
  String get isSubject => jsonObject['isSubject'] ?? '';
  String get isDujia => jsonObject['isDujia'] ?? '';
  String get newsType => jsonObject['newsType'] ?? '';
  String get docID => jsonObject['docID'] ?? '';
  String get dataid => jsonObject['dataid'] ?? '';
  String get newsTag => jsonObject['newsTag'] ?? '';
  int get comment => jsonObject['comment'] ?? 0;

  static NewsModel parser(dynamic jsonObject) {
    return NewsModel(jsonObject: jsonObject);
  }

  static List<NewsModel> list(dynamic jsonObject) {
    var jsonList = jsonObject as List?;
    return jsonList?.map((element) => NewsModel(jsonObject: element)).toList() ?? [];
  }
  
}
