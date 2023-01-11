import 'dart:convert';

class Page {
  int pn;
  int ps;
  int count;

  Page({required this.pn, required this.ps, required this.count});

  @override
  String toString() => 'Page(pn: $pn, ps: $ps, count: $count)';

  factory Page.fromMap(Map<String, dynamic> data) => Page(
        pn: data['pn'] as int,
        ps: data['ps'] as int,
        count: data['count'] as int,
      );

  Map<String, dynamic> toMap() => {
        'pn': pn,
        'ps': ps,
        'count': count,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Page].
  factory Page.fromJson(String data) {
    return Page.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Page] to a JSON string.
  String toJson() => json.encode(toMap());
}
