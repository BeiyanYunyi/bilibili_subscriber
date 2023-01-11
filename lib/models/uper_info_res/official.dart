class Official {
  int? role;
  String? title;
  String? desc;
  int? type;

  Official({this.role, this.title, this.desc, this.type});

  factory Official.fromJson(Map<String, dynamic> json) => Official(
        role: json['role'] as int?,
        title: json['title'] as String?,
        desc: json['desc'] as String?,
        type: json['type'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'title': title,
        'desc': desc,
        'type': type,
      };
}
