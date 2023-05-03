import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ofc2/controller/MaquinasController.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketController extends GetxController {
  static final wsUrl = Uri.parse('ws://192.168.93.1:3001/');
  static var channel;

  static Future<bool> setup() async {
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen((message) {
      MaquinasController.setupList(jsonDecode(message));
    });
    debugPrint("Web Socket inicializado na URL $wsUrl");
    return true;
  }

}