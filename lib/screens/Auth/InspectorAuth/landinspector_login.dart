
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../Widgets/header/header.dart';
import '../../../../constants/app_color.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/spacing_styles.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Dashboard/LandInspectorDashBoard/Dashboard/land_inspector_dashboard.dart';

class LandInspectorSignIn extends StatefulWidget {
  const LandInspectorSignIn({super.key});

  @override
  State<LandInspectorSignIn> createState() => _LandInspectorSignInState();
}

class _LandInspectorSignInState extends State<LandInspectorSignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void login(String email, password) async {
    try {
      var response = await http.post(
          Uri.parse("http://localhost/block_backend/public/inspector/auth"),
          body: {"email":email, "password": password});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LandInspectorDashBoard()),
        );
        print(response.statusCode);
        print("Account create successfully");
      } else {
        print(response.statusCode);

      }
    } catch (e) {
      print(e.toString());
    }
  }
  String errorMessage = '';
  bool _isLoading = false;
  String email = "";
  String password = "";
  var _isObscured;
  RegExp pass_validation = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool validatePassword(String password){
    String _pass = password.trim();
    if(_pass.isEmpty){
      setState(() {
        password_strength=0;
      });
    }else if(_pass.length<6){
      setState(() {
        password_strength = 1/4;
      });

    }else if(_pass.length<=6){
      setState(() {
        password_strength = 2/4;
      });

    }else{
      if(pass_validation.hasMatch(_pass)){
        setState(() {
          password_strength = 2/4;
        });
      }else{
        return false;
      }
    }
    return false;

  }




  double password_strength =0;




  void displayMessage(String message){
    showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Text(message),

        ));
  }


  @override
  void initState(){
    super.initState();
    _isObscured = true;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,

        // backgroundColor:Color(0xFFCDA379),
        appBar: AppBar(
          leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(CupertinoIcons.arrow_left,color: Colors.white,)),
          backgroundColor: const Color(0xFF272D34),
          title: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        body: _isLoading? Center(  child: CircularProgressIndicator(color: AppColor.secondary2,),): SingleChildScrollView(

          child: Padding(
            padding:TSpacingStyles.paddingWIthAppBarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                LogInHeader(),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Form
                    (
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                color: Colors.black),
                            decoration:  InputDecoration(
                              prefixIcon: Icon( Icons.email_outlined, color: Colors.black,) ,

                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.black),
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(width: 0, style: BorderStyle.solid)),
                            ) ,
                            onChanged: (val){
                              setState(() {
                                email = val;
                              });
                            },
                            validator: (val){
                              return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!)? null : "Please Enter a Valid Email";
                            },
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _isObscured,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                color: Colors.black),
                            decoration:  InputDecoration(
                              prefixIcon: Icon( Iconsax.password_check, color: Colors.black,) ,
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _isObscured =! _isObscured;
                                    });
                                  }, icon: _isObscured ? Icon(Icons.remove_red_eye_sharp, color: Colors.black,) :Icon(Iconsax.eye_slash, color: Colors.black,)
                              ),

                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(width: 0, style: BorderStyle.solid)),
                            ) ,

                            onChanged: (value){
                              setState(() {
                                _formKey.currentState!.validate();
                              });
                            },
                          ),
                          Center(child: Text(errorMessage),),
                          const SizedBox(height: 10,),

                          const SizedBox(height: SizeConfig.spacingBetween,),
                          Container(
                            padding: EdgeInsets.only(top: 3,left: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: const Border(
                                  bottom: BorderSide(color: Colors.transparent),
                                  top: BorderSide(color: Colors.transparent),
                                  left: BorderSide(color: Colors.transparent),
                                  right: BorderSide(color: Colors.transparent),
                                )
                            ),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              height: 40,
                              onPressed: (){
                                login(_emailController.text.toString(),
                                    _passwordController.text.toString());
                              },

                              color: AppColor.accent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: const Text("Sign in", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          ),
                          const SizedBox(height: 16,),
                          // Text.rich(
                          //   TextSpan(
                          //       text:   "Don\'t have an Account ?   ",
                          //       style:
                          //       TextStyle(
                          //           color: Colors.grey[700],
                          //           fontWeight: FontWeight.bold
                          //       ),
                          //       children: <TextSpan>[
                          //
                          //         TextSpan(
                          //             text: "Register with us here !",
                          //             style:
                          //             TextStyle(
                          //                 color: Colors.blue,
                          //                 fontWeight: FontWeight.bold,
                          //                 decoration: TextDecoration.underline
                          //             ),
                          //             recognizer: TapGestureRecognizer()..onTap=(){
                          //               nextScreen(context, const RegisterUserScreen());
                          //             }
                          //         )
                          //       ]
                          //   ),
                          // ),
                        ],
                      )
                  ),
                ),

              ],
            ),),
        )
    );

  }

}
