import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexproje/Uihelper.dart';
import 'package:pokedexproje/homepage.dart';

import 'Pokemonmodel.dart';
class Detay extends StatelessWidget {

  late Pokemon gecici;

  late int sira;
  
  Detay(Pokemon p,int index)
  {
    gecici=p;
    sira=index;
  }
  
  
  

  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          
          backgroundColor: Hesaplar.Rengidondur(gecici.type[0].toString()),

          body:
            SafeArea(


                  child:Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children:[


                      IconButton(onPressed:()
                            {
                              Navigator.of(context).pop();
                            },
                            icon:Icon(Icons.arrow_back_ios,color:Colors.white,size:35.w),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(8.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[

                                  Text(gecici.name,style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color:Colors.white)),

                                  SizedBox(width:100),

                                  Text('# ${gecici.num}',style:TextStyle(fontSize: 35,fontWeight: FontWeight.w500,color:Colors.white)),

                                ]
                              ),
                              SizedBox(height: 50),

                              Chip(label:Text(gecici.type.join('    '))),

                            ],

                          ),
                        ),

                      Row(
                        children: [

                          Container(
                            width: 100.w,

                            height:50.h,

                          ),
                          SizedBox(width: 50),

                          CachedNetworkImage(imageUrl: gecici.img,width: 150.w,height:150.h,fit:BoxFit.fitWidth),
                        ],
                      ),

                      Expanded(
                        child: Container(
                          height:550,
                          width: double.infinity,

                          decoration:BoxDecoration(

                            borderRadius: BorderRadius.circular(10.w),
                            color:Colors.white,
                          ) ,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [

                                         Align(
                                           alignment: Alignment.center,
                                             child: Image.asset('images/pokeball.png',height:250.h,width: 250.h,fit:BoxFit.fitWidth)),
                        
                        
                                    Positioned(
                                      right:0,
                                      left:0,
                        
                                      child: Column(
                                      children:[
                                        _buildInformationRow('Name:',gecici.name),
                                        SizedBox(height:50),
                                        _buildInformationRow('Height:',gecici.height),
                                        SizedBox(height:50),
                                        _buildInformationRow('Weight:',gecici.weight),
                                        SizedBox(height:50),
                                        _buildInformationRow('Spawn Time:',gecici.spawnTime),
                                        SizedBox(height:50),
                                        _buildInformationRow('Pre Evolution:',gecici.prevEvolution),
                                        SizedBox(height:50),
                                        _buildInformationRow('Next Evolution:',gecici.nextEvolution),
                        
                                      ]
                                      ),
                                    ),

                              ],
                                ),
                              ),
                            ),
                      ),
                    ]

                  ),
                ),





            );

        
  }
}

Row _buildInformationRow(String s, var name)
{
  if(name is String)
    {
      return
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text(s,style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
              Text(name,style:TextStyle(fontSize:25,fontWeight: FontWeight.w400)),
            ],
          );
    }

  else if(name is List&&name.isNotEmpty)
    {

      return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(s,style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
            Text(name[0].toString(),style:TextStyle(fontSize:25,fontWeight: FontWeight.w400)),
          ],
        );

    }
  else
    {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Text(s,style:TextStyle(fontSize:30,fontWeight: FontWeight.bold)),
          Text('Not Avaliable.',style:TextStyle(fontSize:25,fontWeight: FontWeight.w400)),
        ],
      );
    }
}
