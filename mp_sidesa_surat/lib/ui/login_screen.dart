import 'package:flutter/material.dart';
//import 'package:mp_sidesa_surat/ui/signup_screen.dart';
import 'package:mp_sidesa_surat/ui/registrasi_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mp_sidesa_surat/ui/registrasi_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  get data => null;

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Color.fromARGB(255, 4, 108, 243),
                    gradient: LinearGradient(
                        colors: [
                          (Color.fromARGB(255, 4, 108, 243)),
                          (Color.fromARGB(255, 108, 164, 237))
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Image.asset('images/logo.png'),
                        height: 90,
                        width: 90,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25, top: 20),
                        alignment: Alignment.center,
                        child: const Text(
                          "Aplikasi Surat Desa Siluman",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )
                    ]))),

            /*FIELD MASUKAN EMAIL*/
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
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
                controller: email,
                cursorColor: const Color.fromARGB(255, 4, 108, 243),
                decoration: const InputDecoration(
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
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                controller: password,
                obscureText: true,
                cursorColor: const Color.fromARGB(255, 4, 108, 243),
                decoration: const InputDecoration(
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
                margin: const EdgeInsets.only(top: 20, right: 25),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    child: const Text("Lupa Password"), onTap: () => {})),
            GestureDetector(
              onTap: () => {
                /*TULIS KODE ONCLIK NYA DISINI!!!*/
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  // ignore: prefer_const_literals_to_create_immutables
                  gradient: const LinearGradient(colors: [
                    (Color.fromARGB(255, 4, 108, 243)),
                    (Color.fromARGB(255, 108, 164, 237))
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE))
                  ],
                ),
                child: GestureDetector(
                  child: const Text("LOGIN ATUH",
                      style: TextStyle(color: Colors.white)),
                  onTap: () => {
                    _doLogin(),
                  },
                ),
              ),
            ),

            /*BAGIAN REGISTRASI*/
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Belum Punya akun?"),
                  GestureDetector(
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrasiPage()))
                          },
                      child: const Text("Register",
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

  Future _doLogin() async {
    if (password.text.isEmpty || password.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Email atau Password belun terisi ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 15.0,
      );
    }
  }
}
