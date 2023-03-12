import 'package:flutter/material.dart';
import 'package:hang_game_project/language.dart';
import 'package:hang_game_project/screen/home_screen.dart';
import 'package:hang_game_project/ui/colors.dart';

import 'package:hang_game_project/ui/widget/letter.dart';
import 'package:hang_game_project/utils/game.dart';
import 'package:quickalert/quickalert.dart';


class HomeAppAr extends StatefulWidget {
  const HomeAppAr({Key? key}) : super(key: key);

  @override
  State<HomeAppAr> createState() => _HomeAppArState();
}

class _HomeAppArState extends State<HomeAppAr> {
  int counteur = 7;

  int test = 0 ;
  Game _game = Game();
  Language _language = Language();

  late String randomItem = (_language.wardsAr..shuffle()).first;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(randomItem);
    Game.tries = 0;
    Game.selectedChar= [];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman Game"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(

            child:
              Column(
                children: [
                  SizedBox(
                    height: 55,
                  ),
                  Text('${counteur -Game.tries}: عدد المحاولات   ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),),
                ],
              )

          ),

         //Right to left
          Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: randomItem.split('')
                  .map((e) => letter(e.toUpperCase(),
                  !Game.selectedChar.contains(e.toUpperCase())))
                  .toList(),
            ),
          ),

          //Now let's build the Game keyboard
          Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(

              width: double.infinity,
              height: 250.0,
              child: GridView.count(

                crossAxisCount: 7,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                padding: EdgeInsets.all(8.0),
                children: _language.alphabetsAr.map((e) {
                  return RawMaterialButton(
                    onPressed: Game.selectedChar.contains(e)
                        ? null // we first check that we didn't selected the button before
                        : () {
                      setState(()  {
                        Game.selectedChar.add(e);
                        print(Game.selectedChar);
                        if (!randomItem.split('').contains(e.toUpperCase())) {
                          Game.tries++;
                          print(Game.tries);
                          print(e);


                        }
                        if (randomItem.split('').contains(e.toUpperCase())) {


                          test= test+(e.allMatches(randomItem).length);
                          print(test);

                        }

                        if(test == randomItem.length){
                          QuickAlert.show(context: context,
                              type: QuickAlertType.success,
                              barrierDismissible: false,
                              title: 'احسنت',
                              text: ' لقد نجحت ب ${Game.tries}  اخطاء',
                              onConfirmBtnTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                                );

                              }
                          );


                        }
                        if(Game.tries>6){
                          QuickAlert.show(
                              context:context,
                              type:QuickAlertType.error,
                              barrierDismissible: false,
                              title: 'خسرت',
                              text: 'حاول مرة أخرى',
                              onConfirmBtnTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                                );

                              }

                          );
                        }

                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    fillColor: Game.selectedChar.contains(e)
                        ? Colors.black87
                        : Colors.red,
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}


