class Pendant {
  int pid;
  String name;
  String image;
  int expire;
  String imageEnhance;
  String imageEnhanceFrame;

  Pendant({
    required this.pid,
    required this.name,
    required this.image,
    required this.expire,
    required this.imageEnhance,
    required this.imageEnhanceFrame,
  });

  factory Pendant.fromJson(Map<String, dynamic> json) => Pendant(
        pid: json['pid'] as int,
        name: json['name'] as String,
        image: json['image'] as String,
        expire: json['expire'] as int,
        imageEnhance: json['image_enhance'] as String,
        imageEnhanceFrame: json['image_enhance_frame'] as String,
      );

  Map<String, dynamic> toJson() => {
        'pid': pid,
        'name': name,
        'image': image,
        'expire': expire,
        'image_enhance': imageEnhance,
        'image_enhance_frame': imageEnhanceFrame,
      };
}
