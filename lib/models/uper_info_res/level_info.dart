class LevelInfo {
  int currentLevel;
  int currentMin;
  int currentExp;
  int nextExp;

  LevelInfo({
    required this.currentLevel,
    required this.currentMin,
    required this.currentExp,
    required this.nextExp,
  });

  factory LevelInfo.fromJson(Map<String, dynamic> json) => LevelInfo(
        currentLevel: json['current_level'] as int,
        currentMin: json['current_min'] as int,
        currentExp: json['current_exp'] as int,
        nextExp: json['next_exp'] as int,
      );

  Map<String, dynamic> toJson() => {
        'current_level': currentLevel,
        'current_min': currentMin,
        'current_exp': currentExp,
        'next_exp': nextExp,
      };
}
