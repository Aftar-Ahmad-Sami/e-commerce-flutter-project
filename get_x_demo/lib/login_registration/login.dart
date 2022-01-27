import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_x_demo/hubView.dart';
import 'package:http/http.dart' as http;

import '../home.dart';
import 'registration.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget _terms() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 18),
      child: FlatButton(
        onPressed: () => {print("Terms pressed.")},
        child: Text(
          "Terms & Conditions",
          style: TextStyle(
            color: Color(0xffA6B0BD),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _signUp() {
    return FlatButton(
      onPressed: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => Registration()))
      },
      child: Text(
        "SIGN UP NOW",
        style: TextStyle(
          color: Color(0xFF008FFF),
          fontWeight: FontWeight.w800,
          fontSize: 16,
          fontFamily: 'Agency FB',
        ),
      ),
    );
  }

  Widget _dontHaveAcnt() {
    return Text(
      "Don't have an account?",
      style: TextStyle(
        color: Color(0xffA6B0BD),
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    );
  }

  Widget _loginBtn() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20, bottom: 50),
      decoration: BoxDecoration(
          color: Color(0xff008FFF),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Color(0x60008FFF),
              blurRadius: 10,
              offset: Offset(0, 5),
              spreadRadius: 0,
            ),
          ]),
      child: FlatButton(
        onPressed: () => {loginReq()},
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Text(
          "SIGN IN",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }

  Widget _inputField(
      Icon prefixIcon, String hintText, bool isPassword, var ctrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: ctrl,
        obscureText: isPassword,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xff000912),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _logoText() {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: Text(
        "Login",
        style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w800,
          color: Color(0xff000912),
          letterSpacing: 10,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error!!!"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _logo() {
    return Container(
        margin: EdgeInsets.only(top: 100),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
                left: -50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00bfdb),
                  ),
                )),
            Positioned(
                child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff008FFF),
              ),
            )),
            Positioned(
                left: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff00227E),
                  ),
                ))
          ],
        ));
  }

  var msg = '';

  loginReq() async {
    String url = "https://happybuy.appsticit.com/user_login";
    Uri uri = Uri.parse(url);
    Map data = {
      'phone': _ctPhone.text,
      'password': _ctPass.text,
    };

    var jsonData = json.encode(data);

    var response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonData);

    print(response.statusCode);
    print(response.body);
    var returndata = jsonDecode(response.body);
    var status = returndata["status"];
    msg = returndata["msg"];
    if (status == "success") {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => HubView()));
    } else {
      showAlertDialog(context);
    }
    setState(() {});
  }

  TextEditingController _ctPhone = TextEditingController();
  TextEditingController _ctPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Color(0xFFfafafa),
          width: double.infinity,
          child: Column(
            children: [
              _logo(),
              _logoText(),
              _inputField(
                Icon(Icons.phone_android_outlined,
                    size: 30, color: Color(0xffA6B0BD)),
                "Phone",
                false,
                _ctPhone,
              ),
              _inputField(
                  Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)),
                  "Password",
                  true,
                  _ctPass),
              _loginBtn(),
              _dontHaveAcnt(),
              _signUp(),
              _terms(),
            ],
          ),
        ),
      ),
    );
  }
}
