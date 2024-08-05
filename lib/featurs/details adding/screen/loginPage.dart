import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:plexpay/featurs/details%20adding/screen/BottomNavigation.dart';

import '../Api/logInApi.dart';
import '../Const/SharedPref.dart';
import '../Const/Snackbar_toast_helper.dart';
import 'closePage.dart';

class NewLogin extends StatefulWidget {
  // const Contacts({Key? key}) : super(key: key);

  @override
  _NewLoginState createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var onClick = false;
  var isCheck = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;

    super.initState();
    print("xoxoxo");
    this.getHome();
    setState(() {});
  }

  Future<bool> getHome() async {
    var ck = await getSharedPrefrence(chek);
    print("checkkkkkk");
    print(ck);
    if (ck == "true") {
      var us = await getSharedPrefrence(unm);
      var pws = await getSharedPrefrence(ps);

      setState(() {
        usernameController.text = us;
        passController.text = pws;
        isCheck = true;
      });
    }
    return true;
  }

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CloseScreen()),
    );

    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.3),
          child: AppBar(
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  size.height * 0.3,
                ),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: size.height * 0.06,
                )),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // AnimatedPositioned(
              //   duration: Duration(milliseconds: 500),
              //   curve: Curves.easeOutQuad,
              //   top: 0,
              //   child: WaveWidget(
              //     size: size,
              //     yOffset: size.height / 20,
              //     color: Colors.white,
              //   ),
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.66,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Wrap(
                    runSpacing: 20,
                    children: [
                      newUserName(),
                      newPassword(),
                      checkBox(),
                      Button()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newUserName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: usernameController,
        cursorColor: Colors.black54,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        decoration: new InputDecoration(
          labelText: "Username",
          labelStyle: TextStyle(color: Colors.black26, fontSize: 15),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(),
          ),
        ),
      ),
    );
  }

  Widget newPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        controller: passController,
        cursorColor: Colors.black54,
        obscureText: !_passwordVisible,
        decoration: new InputDecoration(
          labelText: "Password",
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            child: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
              size: 20,
            ),
          ),
          labelStyle: TextStyle(color: Colors.black26, fontSize: 15),
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10),
            borderSide: new BorderSide(),
          ),
        ),
      ),
    );
  }

  Widget checkBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
            height: 24.0,
            width: 24.0,
            child: Theme(
              data: ThemeData(
                  unselectedWidgetColor: Color(0xff00C8E8) // Your color
                  ),
              child: Checkbox(
                  activeColor: Color(0xff00C8E8),
                  value: isCheck,
                  onChanged: (v) async {
                    setState(() {
                      isCheck = v!;
                    });

                    if (isCheck == true &&
                        usernameController.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      var un = await sharedPrefrence(
                          unm, usernameController.text.toString());
                      var pass = await sharedPrefrence(
                          ps, passController.text.toString());
                      var ck = await sharedPrefrence(chek, "true");
                    } else {
                      var un = await sharedPrefrence(unm, null);
                      var pass = await sharedPrefrence(ps, null);
                      var ck = await sharedPrefrence(chek, null);
                    }
                  }),
            )),
        SizedBox(width: 10.0),
        Text("Remember Me",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ))
      ]),
    );
  }

  Widget Button() {
    return onClick == true
        ? Container(
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          )
        : InkWell(
            onTap: () async {
              setState(() {
                onClick = true;
              });
              var rsp = await loginApi(usernameController.text.toString(),
                  passController.text.toString());
              print("rspppp");
              print(rsp);
              if (rsp['success'] == true) {
                var id = await sharedPrefrence("userId", rsp['user_id']);
                var token = await sharedPrefrence("token", rsp['access_token']);

                var name = await sharedPrefrence("name", rsp['name']);

                pushNewScreen(
                  context,
                  screen: BottomNavigation(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );

                setState(() {
                  onClick = false;
                });
                showToast("Login Success!");
                print("wrking");
                print(rsp['user_id']);
                print(rsp['access_token']);
              } else {
                showToast("Invalid Credentials!");
                setState(() {
                  onClick = false;
                });
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 55, vertical: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[700]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.5,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          );
  }

  void pushNewScreen(BuildContext context,
      {required BottomNavigation screen,
      required bool withNavBar,
      required PageTransitionAnimation pageTransitionAnimation}) {}
}
