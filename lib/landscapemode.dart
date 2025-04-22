import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedexproje/Uihelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Pokemonmodel.dart';
class Landscapemode extends StatefulWidget {

  late Pokemon gecici;
  Landscapemode(Pokemon analiste)
  {
    gecici=analiste;
  }



  @override
  State<Landscapemode> createState() => _LandscapemodeState();
}

class _LandscapemodeState extends State<Landscapemode> {



  @override
  Widget build(BuildContext context) {
    return


        Scaffold(
          backgroundColor:Hesaplar.Rengidondur(widget.gecici.type[0].toString()),

          body:


            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Container(
                    height:MediaQuery.of(context).size.height,
                    width:((MediaQuery.of(context).size.width)+100)/3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                    ),
                   child: _bilgilerkismi(context,widget.gecici),

                ),
                    //child: _bilgilerkismi(context,widget.gecici)),


                Padding(
                  padding: EdgeInsets.only(top:100.h),
                  child: Container(

                    height:600.h,
                    width:((MediaQuery.of(context).size.width))/2,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(20),
                  ),

                    child:
                      Padding(
                        padding:  EdgeInsets.all(8.h),
                        child: Column(
                          children: [
                            _tablokismi('Name:',widget.gecici.name),
                            SizedBox(height:15.h),
                            _tablokismi('Height:',widget.gecici.height),
                            SizedBox(height:15.h),
                            _tablokismi('Weight:',widget.gecici.weight),
                            SizedBox(height:15.h),
                            _tablokismi('Spawn Time:',widget.gecici.spawnTime),
                            SizedBox(height:15.h),
                            _tablokismi('Pre Evolution:',widget.gecici.prevEvolution),
                            SizedBox(height:15.h),
                            _tablokismi('Next Evolution:',widget.gecici.nextEvolution),
                          ],
                        ),
                      ),
                    
                  ),
                ),
                
              ],
              
            )
            
        );
  }
}

Widget _tablokismi(String name,var  value)
{

 if(value is String)
   {
     return Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children:[
           Text(name,style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
           Text(value,style:TextStyle(fontSize:20,fontWeight: FontWeight.w500)),
       ]
     );

   }
 else if(value is List&&value.isNotEmpty)
   {
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children:[
         Text(name,style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
         Text(value[0].toString(),style:TextStyle(fontSize:20,fontWeight: FontWeight.w500)),
       ],
     );

   }
 else
 {
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children:[
       Text(name,style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
       Text('Not Avaliable.',style:TextStyle(fontSize:20,fontWeight: FontWeight.w500)),
     ],
   );
 }

}

Widget _bilgilerkismi(BuildContext context,Pokemon p)
{

  return
    Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


        IconButton(
            onPressed:()
            {
              Navigator.of(context).pop();
            },
            icon:Icon(Icons.arrow_back_ios,size:100.h,color:Colors.white),
        ),

        SizedBox(height:20),

        Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children:[

          Text(p.name,style:TextStyle(fontSize:35,fontWeight: FontWeight.w700,color:Colors.white)),

          SizedBox(width:20),

          Text('#${p.num.toString()}',style:TextStyle(fontSize: 35,fontWeight: FontWeight.w700,color:Colors.white))
          ],

        ),
        SizedBox(height:20),

        Chip(label:Text(p.type.join(','),style:TextStyle(fontSize: 25,color:Colors.white)),backgroundColor:Hesaplar.Rengidondur(p.type[0].toString())),

        Expanded(
          child: Container(
              child: Align(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(imageUrl: p.img,height:350.h,width: 350.w,fit:BoxFit.fitHeight))
          ),
        ),

      ],

    );
}





