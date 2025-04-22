import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return

        ScreenUtilInit(

          designSize: Size(412,732),

          child: MaterialApp(
            debugShowCheckedModeBanner: false,

            home:Homepage(),




          ),
        );




  }
}




