import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexproje/Uihelper.dart';

import 'Pokemonmodel.dart';

class Pokemoimgbuilt extends StatefulWidget {
  late Pokemon gecici;

  Pokemoimgbuilt(Pokemon p)
  {
    gecici=p;
  }



  @override
  State<Pokemoimgbuilt> createState() => _PokemoimgbuiltState();
}


class _PokemoimgbuiltState extends State<Pokemoimgbuilt> {


  @override
  Widget build(BuildContext context) {
    return

        Stack(

          children: [

            Align(
                alignment:Alignment.topRight,
                child:Image.asset('images/pokeball.png',height:Hesaplar.pokemonunboyutlari(),width:Hesaplar.pokemonunboyutlari())
            ),

            Align(
              alignment:Alignment.topRight,
              child: CachedNetworkImage(
                imageUrl: widget.gecici.img ?? '',height:Hesaplar.pokemonunboyutlari(),width:Hesaplar.pokemonunboyutlari(),
              ),
            )









          ],



        );











  }
}









