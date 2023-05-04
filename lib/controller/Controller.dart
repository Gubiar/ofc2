import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ofc2/models/MaquinaObj.dart';
import 'package:ofc2/models/UsuarioObj.dart';

class Controller extends GetxController {
  static const url = "http://192.168.0.102:3000/";
  static bool isDev = kDebugMode;
  static int resquestDurationSecondsTime = isDev ? 360 : 30;
  static UsuarioObj? usuarioLogado;
}