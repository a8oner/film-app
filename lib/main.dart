import 'package:a11_proje/Kategoriler.dart';
import 'package:a11_proje/FilmlerSayfa.dart';
import 'package:a11_proje/KategorilerCevap.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:  Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  List<Kategoriler> parseKategorilerCevap(String cevap){
    return KategorilerCevap.fromJson(json.decode(cevap)).kategorilerListesi;
  }
  Future<List<Kategoriler>> tumKategorileriGoster() async {
  var url=Uri.parse("http://kasimadalan.pe.hu/filmler/tum_kategoriler.php");
  var cevap=await http.get(url);
  debugPrint('cevap ${cevap.body}'); // Terminale yazdırır
  return parseKategorilerCevap(cevap.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),
      body:FutureBuilder<List<Kategoriler>>(
        future: tumKategorileriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kategoriListesi=snapshot.data;
            debugPrint('liste : $kategoriListesi');
            return ListView.builder(
              itemCount: kategoriListesi?.length,
                itemBuilder: (context,indeks){
                var kategori=kategoriListesi![indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmlerSayfa(kategori: kategori,)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 50,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(kategori.kategori_ad,style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                      ),
                    ),
                  ),
                );
                },
            );
          }else{
            return Center(child: Text('veri yok'),);
          }
        },
      ),
    );
  }
}
