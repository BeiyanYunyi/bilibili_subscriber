import 'card.dart';

class Data {
  Card? card;
  bool? following;
  int? archiveCount;
  int? articleCount;
  int? follower;
  int? likeNum;

  Data({
    this.card,
    this.following,
    this.archiveCount,
    this.articleCount,
    this.follower,
    this.likeNum,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        card: json['card'] == null
            ? null
            : Card.fromJson(json['card'] as Map<String, dynamic>),
        following: json['following'] as bool?,
        archiveCount: json['archive_count'] as int?,
        articleCount: json['article_count'] as int?,
        follower: json['follower'] as int?,
        likeNum: json['like_num'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'card': card?.toJson(),
        'following': following,
        'archive_count': archiveCount,
        'article_count': articleCount,
        'follower': follower,
        'like_num': likeNum,
      };
}
