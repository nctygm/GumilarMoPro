import 'package:flutter/material.dart';
import 'package:mp_sidesa_surat/signup_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  TextEditingController txtemail = new TextEditingController();
  TextEditingController txtpassword = new TextEditingController();

  get data => null;

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    var password;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Color.fromARGB(255, 4, 108, 243),
                    gradient: LinearGradient(
                        colors: [
                          (Color.fromARGB(255, 4, 108, 243)),
                          (new Color.fromARGB(255, 108, 164, 237))
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset('images/logo.png'),
                        height: 90,
                        width: 90,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 25, top: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "Aplikasi Surat Desa Siluman",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )
                    ]))),

            /*FIELD MASUKAN EMAIL*/
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 70),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: txtemail,
                cursorColor: Color.fromARGB(255, 4, 108, 243),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 4, 108, 243),
                    ),
                    hintText: "Masukan Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            /*FIELD MASUKAN PASSWORD*/
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: txtpassword,
                obscureText: true,
                cursorColor: Color.fromARGB(255, 4, 108, 243),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color.fromARGB(255, 4, 108, 243),
                    ),
                    hintText: "Masukan Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
              ),
            ),

            /*LUPA PASSWORD*/
            Container(
                margin: EdgeInsets.only(top: 20, right: 25),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    child: Text("Lupa Password"), onTap: () => {})),
            GestureDetector(
              onTap: () => {
                /*TULIS KODE ONCLIK NYA DISINI!!!*/
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    (new Color.fromARGB(255, 4, 108, 243)),
                    (new Color.fromARGB(255, 108, 164, 237))
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: GestureDetector(
                  child:
                      Text("LOGIN ATUH", style: TextStyle(color: Colors.white)),
                  onTap: () => {
                    _doLogin(context),
                  },
                ),
              ),
            ),

            /*BAGIAN REGISTRASI*/
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Belum Punya akun?"),
                  GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                this.context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()))
                          },
                      child: Text("Register",
                          style: TextStyle(
                            color: Color.fromARGB(255, 4, 108, 243),
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _doLogin(BuildContext cont) async {
    var url = "http://192.168.1.2/loginSISuratDesa/login.php";
    if (data == 'sukses') {
      Navigator.push(
          cont, MaterialPageRoute(builder: (context) => SignUpScreen()));
    } else {
      Fluttertoast.showToast(
        msg: "Email dan Password Tidak terdaftar ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        fontSize: 16.0,
      );
    }
  }
}
