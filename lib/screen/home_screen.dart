import 'package:flutter/material.dart';
import 'package:hang_game_project/main.dart';
import 'package:hang_game_project/screen/home_app_ar.dart';
import 'package:hang_game_project/ui/colors.dart';

import 'home_app_en.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        leading: null,
      ),
      body: Container(
        color: AppColor.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(

            child: Column(

              children: [
                Text('HANGMAN',
                  style:
                TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                SizedBox(height: 150,),
                Text("COMMENCER",
                  style:
                  TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                SizedBox(height: 25,),

                Container(
                  height: 70,
                  width: 350,
                  child: MaterialButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeApp()),
                    );

                  },
                  color: AppColor.primaryColorDark,
                    child: Text('FRANCAIS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),),
                  ),
                ),
                SizedBox(
                  height:20 ,),
                Container(
                  height: 70,
                  width: 350,
                  child: MaterialButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeAppAr()),
                    );

                  },
                    color: AppColor.primaryColorDark,
                    child: Text('ARABIC',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
