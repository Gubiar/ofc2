import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/controller/WebSocketController.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({Key? key}) : super(key: key);

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  init() async {
    await WebSocketController.setup();
    Get.toNamed('/PageLogin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: Get.width * 0.6,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
