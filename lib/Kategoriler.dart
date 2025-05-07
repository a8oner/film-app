class Kategoriler {
  late String kategori_id;
  late String kategori_ad;

  Kategoriler(this.kategori_id, this.kategori_ad);

  factory Kategoriler.fromJson(Map<String, dynamic> json) {
    return Kategoriler(  //burda Kategorilerden nesne oluşturuldu
      json["kategori_id"] as String,
      json["kategori_ad"] as String,
    );
  }
}
