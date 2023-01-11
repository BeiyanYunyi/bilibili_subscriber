import 'level_info.dart';
import 'nameplate.dart';
import 'official.dart';
import 'official_verify.dart';
import 'pendant.dart';
import 'vip.dart';

class Card {
  String mid;
  String name;
  bool approve;
  String sex;
  String rank;
  String face;
  int faceNft;
  int faceNftType;
  String displayRank;
  int regtime;
  int spacesta;
  String birthday;
  String place;
  String description;
  int article;
  List<dynamic>? attentions;
  int fans;
  int friend;
  int attention;
  String sign;
  LevelInfo? levelInfo;
  Pendant? pendant;
  Nameplate? nameplate;
  Official? official;
  OfficialVerify? officialVerify;
  Vip? vip;
  int? isSeniorMember;

  Card({
    required this.mid,
    required this.name,
    required this.approve,
    required this.sex,
    required this.rank,
    required this.face,
    required this.faceNft,
    required this.faceNftType,
    required this.displayRank,
    required this.regtime,
    required this.spacesta,
    required this.birthday,
    required this.place,
    required this.description,
    required this.article,
    this.attentions,
    required this.fans,
    required this.friend,
    required this.attention,
    required this.sign,
    this.levelInfo,
    this.pendant,
    this.nameplate,
    this.official,
    this.officialVerify,
    this.vip,
    this.isSeniorMember,
  });

  factory Card.fromJson(Map<String, dynamic> json) => Card(
        mid: json['mid'] as String,
        name: json['name'] as String,
        approve: json['approve'] as bool,
        sex: json['sex'] as String,
        rank: json['rank'] as String,
        face: json['face'] as String,
        faceNft: json['face_nft'] as int,
        faceNftType: json['face_nft_type'] as int,
        displayRank: json['DisplayRank'] as String,
        regtime: json['regtime'] as int,
        spacesta: json['spacesta'] as int,
        birthday: json['birthday'] as String,
        place: json['place'] as String,
        description: json['description'] as String,
        article: json['article'] as int,
        attentions: json['attentions'] as List<dynamic>?,
        fans: json['fans'] as int,
        friend: json['friend'] as int,
        attention: json['attention'] as int,
        sign: json['sign'] as String,
        levelInfo: json['level_info'] == null
            ? null
            : LevelInfo.fromJson(json['level_info'] as Map<String, dynamic>),
        pendant: json['pendant'] == null
            ? null
            : Pendant.fromJson(json['pendant'] as Map<String, dynamic>),
        nameplate: json['nameplate'] == null
            ? null
            : Nameplate.fromJson(json['nameplate'] as Map<String, dynamic>),
        official: json['Official'] == null
            ? null
            : Official.fromJson(json['Official'] as Map<String, dynamic>),
        officialVerify: json['official_verify'] == null
            ? null
            : OfficialVerify.fromJson(
                json['official_verify'] as Map<String, dynamic>),
        vip: json['vip'] == null
            ? null
            : Vip.fromJson(json['vip'] as Map<String, dynamic>),
        isSeniorMember: json['is_senior_member'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'mid': mid,
        'name': name,
        'approve': approve,
        'sex': sex,
        'rank': rank,
        'face': face,
        'face_nft': faceNft,
        'face_nft_type': faceNftType,
        'DisplayRank': displayRank,
        'regtime': regtime,
        'spacesta': spacesta,
        'birthday': birthday,
        'place': place,
        'description': description,
        'article': article,
        'attentions': attentions,
        'fans': fans,
        'friend': friend,
        'attention': attention,
        'sign': sign,
        'level_info': levelInfo?.toJson(),
        'pendant': pendant?.toJson(),
        'nameplate': nameplate?.toJson(),
        'Official': official?.toJson(),
        'official_verify': officialVerify?.toJson(),
        'vip': vip?.toJson(),
        'is_senior_member': isSeniorMember,
      };
}
