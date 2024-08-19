import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:training_management/Screen/login_page.dart';
import 'package:training_management/Screen/member_register_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: size.height*0.1,
            ),

            ///筋トレアイコン
            SizedBox(
              height: size.height*0.38,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(
                      'assets/images/muscle.json',
                      errorBuilder: (context, error, stackTrace) {
                        return const Padding(
                          padding: EdgeInsets.all(10),
                          child: CircularProgressIndicator(),
                        );
                      }
                  ),

                  Positioned(
                    top: size.height*0.235,
                    child: Text('筋トレ管理',style: GoogleFonts.rampartOne(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                    ),),
                  )
                ],
              ),
            ),

            SizedBox(
              height: size.height*0.15,
            ),

            ///会員登録ボタン
            Padding(
              padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
              child: SizedBox(
                height: size.height*0.05,
                width: size.width*0.7,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MemberRegisterPage()));
                  },
                  child: Text(
                    '会員登録',
                    style: GoogleFonts.mPlusRounded1c(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            ///ログインボタン
            Padding(
              padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
              child: SizedBox(
                height: size.height*0.05,
                width: size.width*0.7,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    'ログイン',
                    style: GoogleFonts.mPlusRounded1c(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
