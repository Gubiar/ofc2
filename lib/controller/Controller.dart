import 'package:flutter/foundation.dart';
import 'package:ofc2/models/UsuarioObj.dart';

class Controller {
  static const url = "https://backend.com";
  static bool isDev = kDebugMode;
  static int resquestDurationSecondsTime = isDev ? 360 : 30;


  static UsuarioObj? usuarioLogado;


}