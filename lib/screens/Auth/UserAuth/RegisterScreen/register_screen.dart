
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:file_picker/file_picker.dart';


import '../../../../constants/app_color.dart';
import '../../../../constants/sizes.dart';

import '../SigninScreen/sign_in.dart';


class RegisterUserScreen extends StatefulWidget {
  final Function()? onTap;
  const RegisterUserScreen({super.key, this.onTap});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {

  bool _isLoading = false;
  String errorMessage = '';
  final GlobalKey<FormState> _key = GlobalKey <FormState>();
  String fullName = "";
  String phoneNumber = "";
  String email = "";
  String password = "";
  // final hidePassword = true.obs;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final firstNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final lastNameTextController = TextEditingController();
  var _isObscured;
  double password_strength = 0;
  RegExp pass_validation = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
  RegExp NumberReg = RegExp(r".*[0-9].*");
  String text = "";
  String? _filePath;

  Future<void> _selectDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    }
  }

  void validatePassword(String value) {
    password = value.trim();
    if (password.isEmpty) {
      setState(() {
        password_strength = 0;
        text = "Please Enter Password";
      });
    } else if (password.length < 6) {
      setState(() {
        password_strength = 1 / 4;
        text = "Your Password is Too Short";
      });
    } else if (password.length <= 6) {
      setState(() {
        password_strength = 2 / 4;
        text = "Your Password is Acceptable but not strong";
      });
    } else {
      if (pass_validation.hasMatch(password)) {
        setState(() {
          password_strength = 4 / 4;
        });
      } else {
        if (letterReg.hasMatch(password) || NumberReg.hasMatch(password)) {
          setState(() {
            password_strength = 3 / 4;
            text = "Your password is strong";
          });
        } else {
          setState(() {
            password_strength = 1;
            text = "Your password is great";
          });
        }
      }
    }
    return;
  }



  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }



  void displayMessage(String message) {
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(message),
            ));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF272D34),
        title: const Text('Register User',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.white,)),
      ),

      body: _isLoading ? Center(
        child: CircularProgressIndicator(color: AppColor.secondary2,),
      ) : SingleChildScrollView(
        padding: EdgeInsets.all(SizeConfig.defaultSpacing1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(" Let\'s Create An Account !!", style:
            // TextStyle(
            //     color: AppColor.secondary,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 30
            // ),
            // ),
            //
            const SizedBox(height: 40,),
            Form(
                key: _key,

                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person_2_outlined,
                                color: Colors.black,),
                              labelText: "Full Name",
                              labelStyle: TextStyle(
                                  color: Colors.black),
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior
                                  .never,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.solid)),
                            ),
                            onChanged: (val) {
                              setState(() {
                                fullName = val;
                              });
                            },
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                return null;
                              } else
                                return "Please Enter Full Name";
                            },
                          ),

                        ),
                        const SizedBox(width: 12,),
                        Expanded(
                          child: TextFormField(
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyle(

                                color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.date_range,
                                color: Colors.black,),
                              labelText: "Age",
                              labelStyle: TextStyle(
                                  color: Colors.black),
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              filled: true,
                              floatingLabelBehavior: FloatingLabelBehavior
                                  .never,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: const BorderSide(
                                      width: 0, style: BorderStyle.solid)),
                            ),
                            onChanged: (val) {
                              setState(() {
                                fullName = val;
                              });
                            },
                            validator: (val) {
                              if (val!.isNotEmpty) {
                                return null;
                              } else
                                return "Please Enter Your Number";
                            },
                          ),

                        ),



                      ],
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(

                          color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined, color: Colors.black,),

                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Colors.black),
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.solid)),
                      ),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                            ? null
                            : "Please Enter a Valid Email";
                      },
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(

                          color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Iconsax.location, color: Colors.black,),

                        labelText: "Address",
                        labelStyle: TextStyle(
                            color: Colors.black),
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior
                            .never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.solid)),
                      ),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      validator: (val) {
                        if (val!.isNotEmpty) {
                          return null;
                        } else
                          return "Please Enter Your Address";
                      },
                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                        obscureText: _isObscured,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        style: TextStyle(
                            color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password, color: Colors.black,),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscured = !_isObscured;
                                });
                              },
                              icon: _isObscured ? Icon(
                                Icons.remove_red_eye_sharp,) : Icon(
                                CupertinoIcons.eye_slash, color: Colors.black,)
                          ),

                          labelText: "Password",
                          labelStyle: TextStyle(
                              color: Colors.black),
                          hintStyle: TextStyle(
                              color: Colors.black
                          ),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.white.withOpacity(0.3),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 0,
                                style: BorderStyle.none,
                                color: password_strength <= 1 / 4 ? Colors
                                    .redAccent : password_strength == 2 / 4
                                    ? Colors.yellow
                                    : password_strength == 3 / 4
                                    ? Colors.blue
                                    : Colors.green,)),
                        ),

                        onChanged: (value) =>
                            validatePassword(value)
                      // setState(() {
                      //   _key.currentState!.validate();
                      // });

                    ),
                    const SizedBox(height: 25,),
                    TextFormField(
                      obscureText: _isObscured,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password, color: Colors.black,),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                            icon: _isObscured ? Icon(
                              Icons.remove_red_eye_sharp,) : Icon(
                              CupertinoIcons.eye_slash, color: Colors.black,)
                        ),

                        labelText: "Confirm Password",
                        labelStyle: TextStyle(
                            color: Colors.black),
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(width: 0,
                              style: BorderStyle.none,
                              color: password_strength <= 1 / 4 ? Colors
                                  .redAccent : password_strength == 2 / 4
                                  ? Colors.yellow
                                  : password_strength == 3 / 4
                                  ? Colors.blue
                                  : Colors.green,)),
                      ),
                      onChanged: (value) => validatePassword(value),
                    ),
                    const SizedBox(height: 25,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(
                       onPressed: _selectDocument,
                       child: Text('Upload Document'),
                     ),
                     SizedBox(height: 16.0),
                     Text(
                       'Selected document: ${_filePath ?? 'No document selected'}',
                       style: TextStyle(fontSize: 16.0),
                     ),
                   ],
                 ),
                    SizedBox(height: 16.0),
                    LinearProgressIndicator(
                      value: password_strength,
                      backgroundColor: AppColor.gray10,
                      minHeight: 4,
                      color: password_strength <= 1 / 4
                          ? Colors.redAccent
                          : password_strength == 2 / 4
                          ? Colors.yellow
                          : password_strength == 3 / 4 ? Colors.blue : Colors
                          .green,
                    ),
                    const SizedBox(height: 10,),
                    Text(text, style: TextStyle(
                      color: password_strength <= 1 / 4
                          ? Colors.redAccent
                          : password_strength == 2 / 4
                          ? Colors.yellow
                          : password_strength == 3 / 4 ? Colors.blue : Colors
                          .green,),),
                    const SizedBox(height: 5,),
                    Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                            left: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                          )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 40,
                        onPressed: () {
                          // signUp();

                        },
                        color: AppColor.secondary2,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: const Text("Create Account", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account ?",
                          style:
                          TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(width: 5,),

                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignInScreen())),
                          child: Text("Sign-In now !",
                            style:
                            TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                            ),),
                        )
                      ],
                    ),

                  ],
                )
            ),
          ],
        ),
      ),

    );
  }
  // register() async {
  //   if (_key.currentState!.validate()) {
  //     showDialog(context: context,
  //         builder: (context) =>
  //             Center(
  //               child: CircularProgressIndicator(color: AppColor.secondary2,),
  //             ));
  //     try {
  //       await authService.registerUserWithEmailAndPassword(
  //           fullName, phoneNumber, email, password).then((value) async {
  //         if (value == true) {
  //           await HelperFunctions.saveUserLoggedInStatus(true);
  //           await HelperFunctions.saveUserEmailSF(email);
  //           await HelperFunctions.saveUserNameSF(fullName);
  //           await HelperFunctions.saveUserPhoneNumberSF(phoneNumber);
  //           // await HelperFunctions.saveUserAddressSF(address);
  //           // await HelperFunctions.saveUserPostOfficeBoxSF(postOfficeBox);
  //           nextScreenReplace(context, const Dashboard());
  //         } else {
  //           showSnackBar(context, value, Colors.redAccent);
  //           Navigator.pop(context);
  //           setState(() {
  //             _isLoading = false;
  //           });
  //         }
  //       });
  //       errorMessage = '';
  //     } on FirebaseAuthException catch (e) {
  //       errorMessage = e.message!;
  //       Get.snackbar("Required", e.message.toString(),
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: AppColor.secondary50,
  //           colorText: AppColor.backgroundColorDark,
  //           icon: Icon(
  //             Icons.warning_amber_rounded, color: Colors.black, size: 30,)
  //       );
  //     }
  //   }
  // }
}
