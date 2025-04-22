import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Pokemonmodel.dart';

class Hesaplar{



   static int satir()
  {

    if(ScreenUtil().orientation==Orientation.portrait)
      {
        return 2;

      }
    else
      {
        return 3;
      }



  }

  static double yukseklik()
  {
    if(ScreenUtil().orientation==Orientation.portrait)
      {
        return 0.2.sh;
      }
    else
      {
        return 0.2.sw;
      }
  }

  static final Map<String,Color> renkler=
  {
     "Type.BUG":Colors.lightGreen,
     "Type.NORMAL":Colors.indigo,
     "Type.GRASS": Colors.deepPurple,
      "Type.FIRE":Colors.red,
      "Type.WATER":Colors.lightBlue,
      "Type.ELECTRIC":Colors.yellowAccent,
      "Type.ROCK":Colors.black,
      "Type.GROUND":Colors.orange,
       "Type.POISON":Colors.black,
       "Type.PSYCHIC":Colors.teal,
       "Type.FIGHTING":Colors.brown,
       "Type.GHOST":Colors.pink

  };


   static Color ?Rengidondur(String type)
   {
     if(renkler.containsKey(type))
     {
      return renkler[type];

     }
       return Colors.lightGreen;

   }

   static double pokemonunboyutlari()
   {

     if(ScreenUtil().orientation==Orientation.portrait)
     {
       return 0.2.sw;
     }
     else
     {
       return 0.3.sh;
     }

   }














}



