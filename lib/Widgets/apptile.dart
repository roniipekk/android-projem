import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Uihelper.dart';

class Apptile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
        Container(
          height:Hesaplar.yukseklik(),

          color:Colors.black,

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(

              children:[

                Align(
                  alignment:Alignment.bottomLeft,
                    child: Text("Pokedex",style:TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color:Colors.white))),

                Align(
                  alignment: Alignment.topRight,
                    child: Image.asset('images/pokeball.png',height:100.h,width:ScreenUtil().orientation==Orientation.portrait?0.2.sh:100.w,fit:BoxFit.fitWidth)),
              ]

            ),
          ),
        );










  }
}






