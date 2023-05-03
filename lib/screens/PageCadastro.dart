import 'package:flutter/material.dart';
import 'package:ofc2/screens/PageHome.dart';
import 'package:ofc2/screens/PageLogin.dart';

class PageCadastro extends StatefulWidget {
  const PageCadastro({Key? key}) : super(key: key);

  @override
  State<PageCadastro> createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {

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
        title: const Text('Cadastro Usuário'),
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
                "Cadastro",
                style: TextStyle(fontSize:47.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w900,
                    fontFamily: "Roboto"),
              ),

              const Text(
                "Nome",
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
                "Senha",
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              const TextField(
                obscureText: true,
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              const Text(
                "Confirme a senha",
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              const TextField(
                obscureText: true,
                style: TextStyle(fontSize:12.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
              ),

              ElevatedButton(key:null, onPressed:buttonPressed,
                  style: ElevatedButton.styleFrom( backgroundColor: const Color(0xFFe0e0e0),),
                  child:
                  const Text(
                    "Cadastre",
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
                    MaterialPageRoute(builder: (context) => const PageLogin()),
                );
                },

                child: const Text(
                'Voltar',
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
