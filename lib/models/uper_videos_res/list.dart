import 'dart:convert';

import 'vlist.dart';

class BList {
  List<Vlist> vlist;

  BList({required this.vlist});

  @override
  String toString() => 'List(vlist: $vlist)';

  factory BList.fromMap(Map<String, dynamic> data) => BList(
        vlist: (data['vlist'] as List<dynamic>)
            .map((e) => Vlist.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'vlist': vlist.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [List].
  factory BList.fromJson(String data) {
    return BList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [List] to a JSON string.
  String toJson() => json.encode(toMap());
}
