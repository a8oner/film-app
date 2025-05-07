import 'package:a11_proje/Filmler.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  Filmler film;


  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detay Sayfa",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network("http://kasimadalan.pe.hu/filmler/resimler/${widget.film.film_resim}"),
            Text(widget.film.film_yil.toString(),style: TextStyle(fontSize: 30),),
            Text(widget.film.yonetmen.yonetmen_ad,style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}
