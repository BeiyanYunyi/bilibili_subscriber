import 'dart:convert';

import 'episodic_button.dart';
import 'list.dart';
import 'page.dart';

class Data {
  BList? list;
  Page? page;
  EpisodicButton? episodicButton;
  bool? isRisk;
  int? gaiaResType;
  dynamic gaiaData;

  Data({
    this.list,
    this.page,
    this.episodicButton,
    this.isRisk,
    this.gaiaResType,
    this.gaiaData,
  });

  @override
  String toString() {
    return 'Data(list: $list, page: $page, episodicButton: $episodicButton, isRisk: $isRisk, gaiaResType: $gaiaResType, gaiaData: $gaiaData)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        list: data['list'] == null
            ? null
            : BList.fromMap(data['list'] as Map<String, dynamic>),
        page: data['page'] == null
            ? null
            : Page.fromMap(data['page'] as Map<String, dynamic>),
        episodicButton: data['episodic_button'] == null
            ? null
            : EpisodicButton.fromMap(
                data['episodic_button'] as Map<String, dynamic>),
        isRisk: data['is_risk'] as bool?,
        gaiaResType: data['gaia_res_type'] as int?,
        gaiaData: data['gaia_data'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'list': list?.toMap(),
        'page': page?.toMap(),
        'episodic_button': episodicButton?.toMap(),
        'is_risk': isRisk,
        'gaia_res_type': gaiaResType,
        'gaia_data': gaiaData,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
