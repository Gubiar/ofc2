import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/screens/PageHome.dart';
import 'package:ofc2/screens/PageCadastro.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  buttonPressed() {
    Get.toNamed('/PageHome');
  }

  @override
  Widget build(BuildContext context) {

    Size _windowsSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Usuário'),
      ),
      body: Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*const Text(
                "Faça Login",
                style: TextStyle(fontSize:47.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w900,
                    fontFamily: "Roboto"),
              ),*/

              SizedBox(
                width: _windowsSize.width * 0.9,
                child: Column(
                  children: [

                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    StatefulBuilder(
                      builder: (BuildContext context) => TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            labelText: 'Senha',
                            suffixIcon: IconButton(
                                icon: Icon(
                                  size: 20,
                                  color: Color(0xff231942),
                                )
                            )
                        ),
                      ),
                    )

                  ],
                ),
              ),

              ElevatedButton(
                  key: null,
                  onPressed: buttonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFe0e0e0),
                  ),
                  child: const Text(
                    "login",
                    style: TextStyle(
                        fontSize: 23.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto"),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageCadastro()),
                  );
                },
                child: const Text(
                  "não tem conta? clique aqui",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xFFb3b3b3),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
              ),
            ]),
      ),
    );
  }
}
