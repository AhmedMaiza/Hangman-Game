import 'package:flutter/material.dart';
import 'package:hang_game_project/language.dart';
import 'package:hang_game_project/screen/home_screen.dart';
import 'package:hang_game_project/ui/colors.dart';

import 'package:hang_game_project/ui/widget/letter.dart';
import 'package:hang_game_project/utils/game.dart';
import 'package:quickalert/quickalert.dart';



class HomeApp extends StatefulWidget {

  const HomeApp({Key? key,}) : super(key: key);


  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int counteur = 7;
   int test = 0 ;
  Game _game = Game();
  Language _language = Language();


  late String randomItem = (_language.wards..shuffle()).first;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(randomItem);
    Game.tries = 0;
    Game.selectedChar= [];


  }

  //choosing the game word


  //Create a list that contains the Alphabet, or you can just copy and paste it


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
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
                  Text(' nombre de ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Text('tentative : ${counteur -Game.tries}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),),
                ],
              )

          ),

          //Now we will build the Hidden word widget
          //now let's go back to the Game class and add
          // a new variable to store the selected character
          /* and check if it's on the word */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: randomItem.split('')
                .map((e) => letter(e.toUpperCase(),
                !Game.selectedChar.contains(e.toUpperCase())))
                .toList(),
          ),

          //Now let's build the Game keyboard
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: _language.alphabets.map((e) {
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
                            title: 'FELICITATION',
                            text: 'SUCCES AVEC ${Game.tries} FAUTES',
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
                            title: 'DEFAITE',
                            text: 'REPETER ENCORE',
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
          )
        ],
      ),
    );
  }
}
