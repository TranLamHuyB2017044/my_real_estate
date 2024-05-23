import 'package:flutter/material.dart';
import 'package:my_real_estate/Widget/FooterWidget/footer.dart';

class RegisterFormDesktop extends StatefulWidget {
  const RegisterFormDesktop({super.key});

  @override
  State<RegisterFormDesktop> createState() => _RegisterFormDesktopState();
}

class _RegisterFormDesktopState extends State<RegisterFormDesktop> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  void _onChecked(bool? value) {
    setState(() {
      _isChecked = value!;
    });
  }

  bool _showPassword = false;

  void _handleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  bool _showRepeatPassword = false;

  void _handleRepeatShowPassword() {
    setState(() {
      _showRepeatPassword = !_showRepeatPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    double DesktopWidth = MediaQuery.of(context).size.width * 0.35;
    return Center(
      child: Container(
          width: DesktopWidth,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Register',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(),
                        focusColor: Colors.grey,
                        hoverColor: Colors.grey,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                    cursorColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                        focusColor: Colors.grey,
                        hoverColor: Colors.grey,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                    cursorColor: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Stack(children: [
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Colors.grey,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        hintText: 'Password',
                        hoverColor: Colors.grey,
                      ),
                      cursorColor: Colors.grey,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                        onTap: _handleShowPassword,
                        child: _showPassword
                            ? Image.asset(
                                'assets/images/eye.png',
                                color: Colors.black54,
                                width: 30,
                                height: 30,
                              )
                            : Image.asset(
                                'assets/images/eye-off.png',
                                color: Colors.black54,
                                width: 30,
                                height: 30,
                              )),
                  )
                ]),
                SizedBox(
                  height: 25,
                ),
                Stack(children: [
                  Container(
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a repeat password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusColor: Colors.grey,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        hintText: 'Repeat Password',
                        hoverColor: Colors.grey,
                      ),
                      cursorColor: Colors.grey,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                        onTap: _handleRepeatShowPassword,
                        child: _showRepeatPassword
                            ? Image.asset(
                                'assets/images/eye.png',
                                color: Colors.black54,
                                width: 30,
                                height: 30,
                              )
                            : Image.asset(
                                'assets/images/eye-off.png',
                                color: Colors.black54,
                                width: 30,
                                height: 30,
                              )),
                  )
                ]),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Wrap(
                    spacing: 10.0,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white,
                              activeColor: Colors.blue,
                              value: _isChecked,
                              onChanged: _onChecked),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'I Agree With ',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14)),
                              TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                      color: Color(0xff0000ff), fontSize: 14))
                            ])),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff0000ff),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.0))),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                AlertDialog(
                                  content: Text(
                                      'Form is not valid. Please check your input.'),
                                );
                              }
                            },
                            child: const Text('Register',
                                style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
