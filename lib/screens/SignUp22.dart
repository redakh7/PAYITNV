import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_wallet_hps/cubit/app_cubit.dart';
import 'package:m_wallet_hps/cubit/app_states.dart';
import 'package:m_wallet_hps/network/local/cache_helper.dart';
import 'package:m_wallet_hps/screens/ConfirmationScreen.dart';
import 'package:m_wallet_hps/screens/SignUp1/OTP.dart';
import 'package:m_wallet_hps/screens/SignUp2.dart';
import 'package:m_wallet_hps/shared/component.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

import 'SignUp1/custom_page_route.dart';

class SignupPage2 extends StatefulWidget {
  static String id = "SignupScreen";

  const SignupPage2({Key? key}) : super(key: key);

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  final jobRoleCtrl = TextEditingController();

  final formkey = GlobalKey<FormState>();
  var swiftController = DropdownEditingController<String>();
  bool _isObscure = true;
  var LasttnameController = TextEditingController();

  var FirstnameController = TextEditingController();
  var EmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppSigninSuccessStates) {
          showToast(message: "registrated");
          CacheHelper.saveData(key: 'swift', value: state.swift);
          navigateAndFinish(context, const ConfirmationScreen());
        } else if (state is AppLoginErrorStates) {
          showToast(message: state.error);
        }
      },
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.blueGrey,
              title: Row(children: <Widget>[
                Text(
                  "  Ativation",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                )
              ])),
          backgroundColor: Colors.blueGrey,
          body: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 22),
            child: Form(
              key: formkey,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: MediaQuery.of(context).size.height/1.2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 55, right: 55, top: 70, bottom: 30),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'STEP 3: Information ',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Enter your first name,Last name and your email',
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: TextFormField(
                              controller: FirstnameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "the first name must not be empty";
                                }
                                return null;
                              },
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.green,
                                ),
                                hintText: 'First  name ',
                                fillColor: const Color(0xff243656),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 2.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 22),
                            child: TextFormField(
                              controller: LasttnameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "the Last name must not be empty";
                                }
                                return null;
                              },
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.green,
                                ),
                                hintText: 'Last name ',
                                fillColor: const Color(0xff243656),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 22),
                            child: TextFormField(
                              controller: EmailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "the Email must not be empty";
                                }
                                return null;
                              },
                              style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.alternate_email,
                                  color: Colors.green,
                                ),
                                hintText: 'Email ',
                                fillColor: const Color(0xff243656),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 190,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  const Color(0xff1546A0).withOpacity(0.5),
                                  offset: const Offset(0, 24),
                                  blurRadius: 50,
                                  spreadRadius: -18,
                                ),
                              ],
                            ),
                            child: RaisedButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {}
                                Navigator.of(context).push(CustomPageRoute(
                                    child:SignupPage3()),
                                );
                                },
                              textColor: const Color(0xffFFFFFF),
                              padding: const EdgeInsets.all(0),
                              shape: const StadiumBorder(),
                              child: Container(
                                width: 275,
                                height: 65,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.green,
                                      Color(0xff1546A0),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'NEXT',
                                      style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    const Icon(Icons.navigate_next)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
