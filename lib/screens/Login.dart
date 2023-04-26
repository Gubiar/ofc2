import 'package:flutter/material.dart';
import 'package:ofc2/screens/PageHome.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(key: UniqueKey()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Login Usuário'),
          ),
        body:
          new Container(
            child:
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                  "Faça Login",
                    style: new TextStyle(fontSize:47.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w900,
                    fontFamily: "Roboto"),
                  ),
    
                  new Text(
                  "Email",
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                  ),
    
                  new TextField(
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                  ),
    
                  new Text(
                  "senha",
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                  ),
    
                  new TextField(
                    style: new TextStyle(fontSize:12.0,
                    color: const Color(0xFF000000),
                    fontWeight: FontWeight.w200,
                    fontFamily: "Roboto"),
                  ),
    
                  new ElevatedButton(key:null, onPressed:buttonPressed,
                    style: ElevatedButton.styleFrom( backgroundColor: const Color(0xFFe0e0e0),),
                    child:
                      new Text(
                      "login",
                        style: new TextStyle(fontSize:23.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto"),
                      )
                    ),
    
                  new Text(
                  "não tem conta? clique aqui",
                    style: new TextStyle(fontSize:13.0,
                    color: const Color(0xFFb3b3b3),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto"),
                  )
                ]
    
              ),
    
            padding: const EdgeInsets.all(0.0),
            alignment: Alignment.center,
          ),
    
      );
    }
    void buttonPressed(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageHome()),
      );

    }
    
}
