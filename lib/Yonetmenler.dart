class Yonetmenler {
  late String yonetmen_id;
  late String yonetmen_ad;

  Yonetmenler(this.yonetmen_id, this.yonetmen_ad);
  factory Yonetmenler.fromJson(Map<String,dynamic>json){
    return Yonetmenler(
        json["yonetmen_id"] as String,
        json["yonetmen_ad"] as String,
    );
  }
}