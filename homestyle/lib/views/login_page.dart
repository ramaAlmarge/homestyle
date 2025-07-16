import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homestyle/core/resources/asset_manager.dart';
import 'package:homestyle/core/resources/color_manager.dart';
import 'package:homestyle/core/resources/string.dart';
import 'package:homestyle/views/homepage.dart';

import 'package:homestyle/widget/componentbutton.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 327,
              height: 396,
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
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                  'assets/icons/baseline-keyboard_arrow_down-24px.svg',
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
                                  'assets/icons/eye 1.svg',
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
                          TextButton(onPressed: () {}, child: Text('Forgot password')),
                          SizedBox(height: 10),
                          CustomButton(
                            title: 'Log in',
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
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text('sign up')),
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
