class OfficialVerify {
  int? type;
  String? desc;

  OfficialVerify({this.type, this.desc});

  factory OfficialVerify.fromJson(Map<String, dynamic> json) {
    return OfficialVerify(
      type: json['type'] as int?,
      desc: json['desc'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'desc': desc,
      };
}
