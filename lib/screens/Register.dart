import 'package:flutter/material.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({Key? key}) : super(key: key);

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
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
                "Faça o cadastro",
                style: TextStyle(fontSize:43.0,
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
                "email",
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
                "Telefone",
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

              const Text(
                "repetir a senha",
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

              ElevatedButton(
                  key:null,
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFe0e0e0),),
                  child:
                  const Text(
                    "Cadastrar-se",
                    style: TextStyle(fontSize:23.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto"),
                  )
              )
            ]

        ),
      ),

    );
  }
}
