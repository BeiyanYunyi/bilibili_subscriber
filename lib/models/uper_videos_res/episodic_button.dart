import 'dart:convert';

class EpisodicButton {
  String? text;
  String? uri;

  EpisodicButton({this.text, this.uri});

  @override
  String toString() => 'EpisodicButton(text: $text, uri: $uri)';

  factory EpisodicButton.fromMap(Map<String, dynamic> data) {
    return EpisodicButton(
      text: data['text'] as String?,
      uri: data['uri'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'text': text,
        'uri': uri,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [EpisodicButton].
  factory EpisodicButton.fromJson(String data) {
    return EpisodicButton.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [EpisodicButton] to a JSON string.
  String toJson() => json.encode(toMap());
}
