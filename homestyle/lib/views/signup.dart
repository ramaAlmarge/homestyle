import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homestyle/core/resources/asset_manager.dart';
import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/core/resources/string.dart';
import 'package:homestyle/views/homepage.dart';
import 'package:homestyle/widget/componentbutton.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Signup> {
  bool confirmObscure = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
          ),
          Image.asset(Assetmanager.pattern),
          SizedBox(
            height: 12,
          ),
          Text(Stringtext.HelloWELCOMEBACK),
          SizedBox(
            height: 30,
          ),
          Form(
            key: formKey,
            child: Container(
              width: 327,
              height: 520,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 40,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: name, // افترضي أنك عرفتي TextEditingController name;
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        if (value.trim().length < 3) {
                          return 'Name must be at least 3 characters';
                        }
                        if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                          return 'Name can only contain letters and spaces';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            Assetmanager.keyarrow, // عدلي حسب اسم الأيقونة يلي عندك
                            width: 24,
                            height: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (String? emailValue) {
                        final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(emailValue!);
                        if (!emailValid) {
                          return 'invalid Email, please enter your correct infromation';
                        }

                        return null;
                      },
                      controller: email,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            Assetmanager.keyarrow,
                            width: 24,
                            height: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (String? passwordValue) {
                        if (passwordValue!.length < 6) {
                          return 'please enter more than 6 chracters';
                        }
                        return null;
                      },
                      controller: password,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            Assetmanager.eyeopen,
                            width: 24,
                            height: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // داخل StatefulWidget

                    TextFormField(
                      controller: confirmPassword,
                      obscureText: confirmObscure,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmObscure = !confirmObscure;
                            });
                          },
                          icon: SvgPicture.asset(
                            confirmObscure
                                ? Assetmanager.eyeclosed // 'assets/icons/eye_closed.svg'
                                : Assetmanager.eyeopen, // 'assets/icons/eye_open.svg'
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10),
                    CustomButton(
                      title: 'sign up',
                      backgroundColor: Colormanager.primarycolor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid Infromation'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        children: [
                          Text("Already have account? "),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text('sign in')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
