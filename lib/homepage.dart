import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexproje/landscapemode.dart';
import 'package:pokedexproje/pokemoimgbuilt.dart';
import 'package:pokedexproje/verikaynagim.dart';

import 'Pokemonmodel.dart';
import 'Uihelper.dart';
import 'Widgets/apptile.dart';
import 'detay.dart';

class Homepage extends StatefulWidget {


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

   late Future<List<Pokemon>>liste;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    liste=Verikaynagi.internettenveriyicek();

  }


  @override
  Widget build(BuildContext context) {



    return
        Scaffold(

          body:
              //OrientationBuilder ekranin orientation durumu yani dikeyde mi yatayda mi oldugunu anlamamizi saglar bu sayede bilgileri bize getirecek ve bizde bu bilgilerle  cesitli islemler yapacaz//
            OrientationBuilder(
              builder:(context,orientation)=>Column(

                //Mediaquery.of(context) ise ekren boyutu,oryantasyon ve diger ozelliklere erisim saglar//
                children: [

                  Apptile(),

                  Expanded(

                    child: FutureBuilder(
                        future: liste,
                        //Builder iki deger aldıgını unutma snapshot ise future gelen degeri alır ve icindeki datalara gore cesitli islemler yaparız//
                        builder:(context,snapshot)
                        {

                          if(snapshot.hasData)
                            {
                              //Neden dogrudan liste elemanlarini alamadık cunku liste elemanlari future turunden ve dogrudan bunun eleman sayısı ve diger ozelliklerini alamiyoruz ama egerki snapshot data varsa listedeki elemanlari gecici diye yeni bir listeye esitledim//

                              List<Pokemon> analiste=snapshot.data!;

                              return Container(
                                color:Colors.black,
                                child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:Hesaplar.satir()),

                                  itemBuilder:(context,index)
                                    {
                                      return
                                        InkWell(
                                          onTap: ()
                                          {
                                            if(ScreenUtil().orientation==Orientation.landscape)
                                              {
                                                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Landscapemode(analiste[index])));
                                              }
                                            else
                                              {
                                                Navigator.of(context).push(MaterialPageRoute(builder: (contextt)=>Detay(analiste[index],index)));
                                              }

                                          },

                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20), // Yuvarlatılmış köşeler
                                            child: Card(
                                              elevation: 5,
                                              child: Container(
                                                color: Hesaplar.Rengidondur(analiste[index].type[0].toString()),
                                                padding: const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      analiste[index].name.toString(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: orientation==Orientation.landscape?45:28,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    Chip(
                                                      label: Text(analiste[index].type[0].toString()),
                                                      backgroundColor: Colors.grey,
                                                    ),
                                                    Expanded(


                                                        child:Pokemoimgbuilt(analiste[index]),


                                                    )

















                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                    },
                                  itemCount: analiste.length,

                                ),
                              );

                            }
                          else if(snapshot.hasError)
                            {

                              return Text("Sorun var Kontrol Ediniz");
                            }

                          else
                            {
                              //Future builder future turunden bir seyleri beklerken verileri almamizi ve bıunları ekranda cesitli hallerle yansıtmamizi saglar ornek Text widgeti,Scroolview,ListTile vs. bu verileri kontrolunu ise snapshot ile saglanır iki durum vardır ya future turunden aldıgımız deger gelmemistir ya da gelmistir kullanıcının beklemesini istiyorsak eger ekranın bos kalmamasi icin CircularProgressIndicator kullanabiliriz//

                             return  CircularProgressIndicator();

                            }








                        }






                    ),
                  ),
                ],
              ),
            )


















        );








  }
}



