import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/screens/PageCadastro.dart';
import 'package:ofc2/screens/PageHome.dart';
import 'package:ofc2/screens/PageLogin.dart';
import 'package:ofc2/screens/PageSplash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Ofc 2';
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      getPages: [
        GetPage(name: '/', page: () => const PageSplash()),
        GetPage(name: '/PageLogin', page: () => const PageLogin()),
        GetPage(name: '/PageCadastro', page: () => const PageCadastro()),
        GetPage(name: '/PageHome', page: () => const PageHome()),
      ],
    );
  }
}

