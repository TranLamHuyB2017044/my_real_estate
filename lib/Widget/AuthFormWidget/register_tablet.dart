import 'package:flutter/material.dart';
import 'package:my_real_estate/extensions/hover_extension.dart';

// ignore: must_be_immutable
class RegisterFormTablet extends StatefulWidget {
  RegisterFormTablet(
      {super.key,
      required this.emailPattern,
      required this.formKey,
      required this.inputData,
      required this.isChecked,
      required this.showPassword,
      required this.showRepeatPassword,
      required this.onSubmit,
      required this.isLoading});
  final String emailPattern;
  final GlobalKey<FormState> formKey;
  final Map<String, TextEditingController> inputData;
  bool showPassword;
  bool isChecked;
  bool showRepeatPassword;
  void Function() onSubmit;
  bool isLoading;
  @override
  State<RegisterFormTablet> createState() => _RegisterFormTabletState();
}

class _RegisterFormTabletState extends State<RegisterFormTablet> {
  String? password;

  @override
  Widget build(BuildContext context) {
    double tabletWidth = MediaQuery.of(context).size.width * 0.7;
    return Center(
      child: widget.isLoading
          ? Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ))
          : Container(
              width: tabletWidth,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: widget.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Register',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: widget.inputData['username'],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey,
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                      cursorColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: widget.inputData['email'],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a email';
                        }
                        if (!RegExp(widget.emailPattern).hasMatch(value)) {
                          return 'It must be a valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                          focusColor: Colors.grey,
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
                      cursorColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Stack(children: [
                      TextFormField(
                        controller: widget.inputData['password'],
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !widget.showPassword ? true : false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusColor: Colors.grey,
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          hintText: 'Password',
                        ),
                        cursorColor: Colors.black,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.showPassword = !widget.showPassword;
                                  });
                                },
                                child: widget.showPassword
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
                                      ))
                            .showCursorOnHover,
                      )
                    ]),
                    const SizedBox(
                      height: 25,
                    ),
                    Stack(children: [
                      TextFormField(
                        controller: widget.inputData['repeatPassword'],
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !widget.showRepeatPassword ? true : false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a repeat password';
                          }
                          if (value != password) {
                            return 'Repeat password does not match';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusColor: Colors.grey,
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          hintText: 'Repeat Password',
                        ),
                        cursorColor: Colors.black,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.showRepeatPassword =
                                        !widget.showRepeatPassword;
                                  });
                                },
                                child: widget.showRepeatPassword
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
                                      ))
                            .showCursorOnHover,
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
                                  value: widget.isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isChecked = value!;
                                    });
                                  }),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                      text: 'I Agree With ',
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 14)),
                                  TextSpan(
                                      text: 'Terms and Conditions',
                                      style: TextStyle(
                                          color: Color(0xff0000ff),
                                          fontSize: 14))
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(3.0))),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20)),
                                onPressed: () {
                                  if (widget.formKey.currentState!.validate()) {
                                    widget.onSubmit();
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
