import 'label.dart';

class Vip {
  int? type;
  int? status;
  int? dueDate;
  int? vipPayType;
  int? themeType;
  Label? label;
  int? avatarSubscript;
  String? nicknameColor;
  int? role;
  String? avatarSubscriptUrl;
  int? tvVipStatus;
  int? tvVipPayType;
  int? vipType;
  int? vipStatus;

  Vip({
    this.type,
    this.status,
    this.dueDate,
    this.vipPayType,
    this.themeType,
    this.label,
    this.avatarSubscript,
    this.nicknameColor,
    this.role,
    this.avatarSubscriptUrl,
    this.tvVipStatus,
    this.tvVipPayType,
    this.vipType,
    this.vipStatus,
  });

  factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        type: json['type'] as int?,
        status: json['status'] as int?,
        dueDate: json['due_date'] as int?,
        vipPayType: json['vip_pay_type'] as int?,
        themeType: json['theme_type'] as int?,
        label: json['label'] == null
            ? null
            : Label.fromJson(json['label'] as Map<String, dynamic>),
        avatarSubscript: json['avatar_subscript'] as int?,
        nicknameColor: json['nickname_color'] as String?,
        role: json['role'] as int?,
        avatarSubscriptUrl: json['avatar_subscript_url'] as String?,
        tvVipStatus: json['tv_vip_status'] as int?,
        tvVipPayType: json['tv_vip_pay_type'] as int?,
        vipType: json['vipType'] as int?,
        vipStatus: json['vipStatus'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'status': status,
        'due_date': dueDate,
        'vip_pay_type': vipPayType,
        'theme_type': themeType,
        'label': label?.toJson(),
        'avatar_subscript': avatarSubscript,
        'nickname_color': nicknameColor,
        'role': role,
        'avatar_subscript_url': avatarSubscriptUrl,
        'tv_vip_status': tvVipStatus,
        'tv_vip_pay_type': tvVipPayType,
        'vipType': vipType,
        'vipStatus': vipStatus,
      };
}
