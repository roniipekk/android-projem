import 'dart:convert';

import 'package:dio/dio.dart';

import 'Pokemonmodel.dart';

class Verikaynagi
{

  static Future<List<Pokemon>> internettenveriyicek()
   async {

    List<Pokemon> g=[];

      //Dio().get() ile internetten gelemsini istedigim veriyi yaziyorum yani json dosyamizi sonra bunu var turunden bir respone gonderiyorum ve ordaki data kısmını yazdirmak istiyorum//
     var response=await Dio().get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

     //Dio daki verilere response.data ile ulasaiyorum yani response verinin kendisini geitiyor icindekilere ise response.data ile ulasiyorum//

     var gecici=jsonDecode(response.data);

     if(gecici['pokemon'] is List)
       {
         print ("Bu bir liste");

         List<Pokemon> liste= (gecici ['pokemon'] as List).map((gelenpokemonuoku)=>Pokemon.fromJson(gelenpokemonuoku)).toList();

         g=liste;
         return g;

       }
     else
       {
         print("Liste degil");

         return g;
       }
  }





}






