import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_management/Components/registration_success_box.dart';
import 'package:training_management/Firebase/user_firestore.dart';
import 'package:training_management/Models/account.dart';
import 'package:training_management/Utils/authentication.dart';

class MemberRegisterPage extends StatefulWidget {
  const MemberRegisterPage({super.key});

  @override
  State<MemberRegisterPage> createState() => _MemberRegisterPageState();
}

class _MemberRegisterPageState extends State<MemberRegisterPage> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController  weightController = TextEditingController();
  TextEditingController  heightController = TextEditingController();
  TextEditingController  oldController = TextEditingController();
  bool hidePassword = true;
  final userNameFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final passFormKey = GlobalKey<FormState>();
  final repassFormKey = GlobalKey<FormState>();
  final heightFormKey = GlobalKey<FormState>();
  final weightFormKey = GlobalKey<FormState>();
  final oldFormKey = GlobalKey<FormState>();

  String sex = '男性';

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('会員登録',style: GoogleFonts.mPlusRounded1c(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),),
        backgroundColor: Colors.grey,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            children: [

              ///userName
              Form(
                key: userNameFormKey,
                child: TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'ユーザ名',
                    labelText: 'User Name',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'ユーザネームを入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///email
              Form(
                key: emailFormKey,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.mail),
                    hintText: 'hogehoge@qmail.com',
                    labelText: 'Email Address',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'メールアドレスを入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///password
              Form(
                key: passFormKey,
                child: TextFormField(
                  controller: passController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    labelText: 'Password',
                    helperText: '大文字小文字数字いずれかを含む8文字以上',
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'パスワードを入力してください';
                    }else if(value.length < 8){
                      return '8文字以上で入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///repassword
              Form(
                key: repassFormKey,
                child: TextFormField(
                  controller: repassController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    hintText: 'パスワードを再入力してください',
                    labelText: 'Re-Enter Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return '再度パスワードを入力してください';
                    }else if(value != passController.text){
                      return '入力されたパスワードと一致しません';
                    }
                    return null;
                  },
                ),
              ),

              ///Sex
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Icon(Icons.wc),
                        ),
                        Text('Sex',style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Radio(
                          value: '男性',
                          groupValue: sex,
                          onChanged: (value){
                            setState(() {
                              sex = value!;
                            });
                          },
                        ),
                        Text('男性',style: GoogleFonts.mPlusRounded1c(
                        ),),

                        Radio(
                          value: '女性',
                          groupValue: sex,
                          onChanged: (value){
                            setState(() {
                              sex = value!;
                            });
                          },
                        ),
                        Text('女性',style: GoogleFonts.mPlusRounded1c(
                        ),),

                        Radio(
                          value: 'どちらでもない',
                          groupValue: sex,
                          onChanged: (value){
                            setState(() {
                              sex = value!;
                            });
                          },
                        ),
                        Text('どちらでもない',style: GoogleFonts.mPlusRounded1c(
                        ),),
                      ],
                    ),
                  ],
                ),
              ),

              ///old
              Form(
                key: oldFormKey,
                child: TextFormField(
                  controller: oldController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.account_box),

                    hintText: '年齢を入力してください',
                    labelText: 'Old',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return '年齢を入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///Height
              Form(
                key: heightFormKey,
                child: TextFormField(
                  controller: heightController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.height),

                    hintText: '身長を入力してください',
                    labelText: 'Height',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return '身長を入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///Weight
              Form(
                key: weightFormKey,
                child: TextFormField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.monitor_weight),

                    hintText: '体重を入力してください',
                    labelText: 'Weight',
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return '体重を入力してください';
                    }
                    return null;
                  },
                ),
              ),

              ///登録ボタン
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  height: screenSize.height*0.05,
                  width: screenSize.width*0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () async {
                      if(userNameFormKey.currentState!.validate() &&
                          emailFormKey.currentState!.validate() &&
                          passFormKey.currentState!.validate() &&
                          repassFormKey.currentState!.validate() &&
                          oldFormKey.currentState!.validate() &&
                          heightFormKey.currentState!.validate() &&
                          weightFormKey.currentState!.validate()
                      ) {
                        var result = await Authentication.signUp(email: emailController.text, pass: passController.text);
                        if(result is UserCredential){
                          Account newAccount = Account(
                            id: result.user!.uid,
                            name: userNameController.text,
                            emailAddress: emailController.text,
                            sex: sex,
                            old: oldController.text,
                            height: heightController.text,
                            weight: weightController.text,
                          );
                          var _result = await UserFireStore.setUser(newAccount);
                          if(_result == true){
                            if(!mounted) return;
                            print('登録完了');
                            showDialog(
                                context: context,
                                barrierDismissible: false ,
                                builder: (_) => const RegistrationSuccessBox()
                            );
                          }else {
                            Authentication.deleteUser();
                            print('error1');
                          }
                        }else {
                          print('error2');
                        }
                      }
                    },
                    child: Text('登録',style: GoogleFonts.mPlusRounded1c(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
