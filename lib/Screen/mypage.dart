import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_management/Models/account.dart';
import 'package:training_management/Utils/authentication.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Account myAccount = Authentication.myAccount!;

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('マイページ',style: GoogleFonts.mPlusRounded1c(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
          backgroundColor: Colors.grey,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
                print('ログアウト');
              },
              icon: const Icon(Icons.logout,color: Colors.white,),
            )
          ],
        ),

        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height*0.02,
              ),

              Container(
                height: screenSize.height*0.3,
                width: screenSize.width*0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('ユーザネーム : ',style: GoogleFonts.mPlusRounded1c(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),),
                          Text(myAccount.name,style: GoogleFonts.mPlusRounded1c(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: screenSize.height*0.02,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: screenSize.height*0.1,
                          width: screenSize.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('年齢',style: GoogleFonts.mPlusRounded1c(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black87
                                  ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(myAccount.old,style: GoogleFonts.mPlusRounded1c(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22,
                                        color: Colors.black87,
                                      ),),
                                      Padding(
                                        padding: const EdgeInsets.only(left:5.0 ,top: 5.0),
                                        child: Text('歳',style: GoogleFonts.mPlusRounded1c(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                          ),
                        ),
                        Container(
                          height: screenSize.height*0.1,
                          width: screenSize.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('性別',style: GoogleFonts.mPlusRounded1c(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black87
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(myAccount.sex,style: GoogleFonts.mPlusRounded1c(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                      color: Colors.black87,
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: screenSize.height*0.02,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: screenSize.height*0.1,
                          width: screenSize.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('身長',style: GoogleFonts.mPlusRounded1c(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black87
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(myAccount.height,style: GoogleFonts.mPlusRounded1c(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                      color: Colors.black87,
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.only(left:5.0 ,top: 5.0),
                                      child: Text('cm',style: GoogleFonts.mPlusRounded1c(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: screenSize.height*0.1,
                          width: screenSize.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('体重',style: GoogleFonts.mPlusRounded1c(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black87
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(myAccount.weight,style: GoogleFonts.mPlusRounded1c(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                      color: Colors.black87,
                                    ),),
                                    Padding(
                                      padding: const EdgeInsets.only(left:5.0 ,top: 5.0),
                                      child: Text('Kg',style: GoogleFonts.mPlusRounded1c(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: Colors.black87,
                                      ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(
                height: screenSize.height*0.02,
              ),

              Container(
                height: screenSize.height*0.4,
                width: screenSize.width*0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TableCalendar(
                  firstDay: DateTime.utc(2023,1,1),
                  lastDay: DateTime.utc(2030,1,1),
                  focusedDay: DateTime.now(),
                )
              ),

              SizedBox(
                height: screenSize.height*0.02,
              ),

              Container(
                  height: screenSize.height*0.06,
                  width: screenSize.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent
                    ),
                    onPressed: (){},
                    child: Text('筋トレ記録を追加',style: GoogleFonts.mPlusRounded1c(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
