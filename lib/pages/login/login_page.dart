import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:qms/pages/login/recover_password.dart';
import 'package:qms/pages/login/verify_pass.dart';
import 'package:qms/shared_components/colors.dart';
import 'package:qms/shared_components/style.dart';
import 'package:qms/utils/login_request_data.dart';

import '../../config/routing.dart';
import '../../constants/assets_paths.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  final LoginRequestData _loginData = LoginRequestData();
  bool _obscureText = true;
  int textLength = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget button = Text('Login', style: MyStyles().buttonText);
  bool loading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: const Image(image: AssetImage(AssetPath.login_image)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            const SizedBox(width: 18),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Welcome Back!",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                const SizedBox(height: 16),
                                Text("Login",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextFormField(
                                controller: usernameController,
                                onChanged: (value) {
                                  setState(() {
                                    textLength = value.length;
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Username';
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
                                  hintText: 'Username or Id',
                                  hintStyle: MyStyles().hintText,
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                ),
                                onSaved: (String? value) {
                                  _loginData.email = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter Password';
                                    }
                                    return null;
                                  },
                                  autofocus: false,
                                  obscureText: _obscureText,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    hintStyle: MyStyles().hintText,
                                    hintText: 'Password',
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        semanticLabel: _obscureText
                                            ? 'show password'
                                            : 'hide password',
                                      ),
                                    ),
                                  ),
                                  onSaved: (String? value) {
                                    _loginData.password = value!;
                                  }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 30),
                              child: ButtonTheme(
                                height: 50,
                                child: TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                  },
                                  child: loading
                                      ? GlowingProgressIndicator(
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Loading",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall),
                                                JumpingDotsProgressIndicator(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      : Text('Login',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
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
                                Navigator.of(context).push(Routing().createRoute(RecoverPassword()));
                              },
                              child: Text("Forgot password?",
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
      ),
    );
  }
}
