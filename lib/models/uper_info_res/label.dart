class Label {
  String? path;
  String? text;
  String? labelTheme;
  String? textColor;
  int? bgStyle;
  String? bgColor;
  String? borderColor;
  bool? useImgLabel;
  String? imgLabelUriHans;
  String? imgLabelUriHant;
  String? imgLabelUriHansStatic;
  String? imgLabelUriHantStatic;

  Label({
    this.path,
    this.text,
    this.labelTheme,
    this.textColor,
    this.bgStyle,
    this.bgColor,
    this.borderColor,
    this.useImgLabel,
    this.imgLabelUriHans,
    this.imgLabelUriHant,
    this.imgLabelUriHansStatic,
    this.imgLabelUriHantStatic,
  });

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        path: json['path'] as String?,
        text: json['text'] as String?,
        labelTheme: json['label_theme'] as String?,
        textColor: json['text_color'] as String?,
        bgStyle: json['bg_style'] as int?,
        bgColor: json['bg_color'] as String?,
        borderColor: json['border_color'] as String?,
        useImgLabel: json['use_img_label'] as bool?,
        imgLabelUriHans: json['img_label_uri_hans'] as String?,
        imgLabelUriHant: json['img_label_uri_hant'] as String?,
        imgLabelUriHansStatic: json['img_label_uri_hans_static'] as String?,
        imgLabelUriHantStatic: json['img_label_uri_hant_static'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'path': path,
        'text': text,
        'label_theme': labelTheme,
        'text_color': textColor,
        'bg_style': bgStyle,
        'bg_color': bgColor,
        'border_color': borderColor,
        'use_img_label': useImgLabel,
        'img_label_uri_hans': imgLabelUriHans,
        'img_label_uri_hant': imgLabelUriHant,
        'img_label_uri_hans_static': imgLabelUriHansStatic,
        'img_label_uri_hant_static': imgLabelUriHantStatic,
      };
}
