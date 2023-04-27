import 'package:flutter/material.dart';
import 'package:ofc2/screens/PageHome.dart';
import 'package:ofc2/screens/PageCadastro.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  buttonPressed(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PageHome()),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Usuário'),
      ),
      body:
      Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Faça Login",
                style: TextStyle(fontSize:47.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w900,
                    fontFamily: "Roboto"),
              ),

              const Text(
                "Email",
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              const TextField(
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              const Text(
                "senha",
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              const TextField(
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              ElevatedButton(key:null, onPressed:buttonPressed,
                  style: ElevatedButton.styleFrom( backgroundColor: const Color(0xFFe0e0e0),),
                  child:
                  const Text(
                    "login",
                    style: TextStyle(fontSize:23.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto"),
                  )
              ),

              
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PageCadastro()),
                );
                },

                child: const Text(
                "não tem conta? clique aqui",
                style: TextStyle(fontSize:13.0,
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
