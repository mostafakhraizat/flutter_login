import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:qms/constants/assets_paths.dart';
import 'package:qms/pages/login/verify_pass.dart';
import 'package:qms/shared_components/colors.dart';
import 'package:qms/shared_components/style.dart';
import 'package:qms/utils/login_request_data.dart';

import '../../config/routing.dart';


class RecoverPassword extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return _RecoverPasswordState();
  }
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final GlobalKey<FormState> _key = GlobalKey();
  final LoginRequestData _loginData = LoginRequestData();
  bool loading = false;
  int textLength = 0;
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image.asset(AssetPath.recover_password),
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const[
                                Text("Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                    "Don't worry! It happens. Please enter\nthe address associated with your account.",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width - 40,
                            child: TextFormField(
                              controller: emailController,
                              onChanged: (value) {
                                setState(() {
                                  textLength = value.length;
                                });
                              },
                              style: MyStyles().normalBlack ,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email Address';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              decoration: InputDecoration(
                                suffixIcon: textLength > 0
                                    ? Icon(
                                  Icons.check_circle,
                                  color: Colors_().primary,
                                )
                                    : const Icon(
                                  Icons.info_outline,
                                  color: Colors.grey,
                                ),
                                hintText: 'Email',
                                contentPadding:
                                const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide:
                                  const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                              ),
                              onSaved: (String? value) {
                                _loginData.email = value!;
                              },
                            ),
                          )  ,
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin:
                              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                              child: ButtonTheme(
                                height: 50,
                                child: TextButton(
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      _key.currentState!.save();
                                      Navigator.of(context).push(Routing().createRoute(PinCodeVerificationScreen(
                                          emailController.text.toString())));
                                    } else {}
                                  },
                                  child:  Center(
                                      child: Text(
                                        "Recover",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      )),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors_().primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            width: MediaQuery.of(context).size.width - 80,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          TextButton(
                            onPressed: () {

                            },
                            child:  Text("Try another way?",
                                style: MyStyles().normalGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
