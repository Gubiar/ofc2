import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/screens/PageLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title ='Ofc 2';
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: title,
      getPages: [
        GetPage(name: '/', page: () => const PageLogin()),
      ],
    );
  }
}

