import 'package:a11_proje/Kategoriler.dart';
import 'package:a11_proje/Yonetmenler.dart';

class Filmler {
  late String film_id;
  late String film_ad;
  late String film_yil;
  late String film_resim;
  late Kategoriler kategori;
  late Yonetmenler yonetmen;

  Filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);

  factory Filmler.fromJson(Map<String,dynamic>json){
   return Filmler(
    json["film_id"]as String,
    json["film_ad"]as String,
    json["film_yil"]as String,
    json["film_resim"]as String,
    Kategoriler.fromJson(json["kategori"]),
    Yonetmenler.fromJson(json["yonetmen"]),


   );
  }
}