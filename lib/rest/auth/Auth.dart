import 'package:http/http.dart' as http;
import 'package:ofc2/controller/Controller.dart';
import 'package:ofc2/models/UsuarioObj.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Auth{

  static Future<String> postLogin(String login, String senha) async {

    String mapToSend = '{"email":"$login","password":"$senha"}';
    debugPrint('postLogin body $mapToSend');

    try {
      http.Response response = await http.post(
        Uri.parse('${Controller.url}auth/login'),
        headers: {
          "Content-Type": "application/json",
        },
        body: mapToSend,

      ).timeout(
          Duration(seconds: Controller.resquestDurationSecondsTime),
          onTimeout: () => http.Response(
            'timeout',
            408,
          )
      );

      debugPrint('postLogin URL-> ${Controller.url}auth/login.json\n');
      debugPrint('postLogin CODE-> ${response.statusCode}');
      debugPrint('postLogin response->${response.body}');

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['success'].toString() == 'true') {

        Controller.usuarioLogado = UsuarioObj(json: jsonData);
        (await SharedPreferences.getInstance()).setString('token', Controller.usuarioLogado!.token!.toString());
        return 'true';

      } else {
        return jsonData['message'].toString();
      }

    } catch (error) {
      debugPrint('erro postLogin: $error');

      return 'catch';
    }
  }

  static Future<String> postCadastro(String mapToSend) async {

    debugPrint('postCadastro body $mapToSend');

    try {
      http.Response response = await http.post(
        Uri.parse('${Controller.url}auth/register'),
        headers: {
          "Content-Type": "application/json",
        },
        body: mapToSend,

      ).timeout(
          Duration(seconds: Controller.resquestDurationSecondsTime),
          onTimeout: () => http.Response(
            'timeout',
            408,
          )
      );

      debugPrint('postCadastro URL-> ${Controller.url}auth/register\n');
      debugPrint('postCadastro CODE-> ${response.statusCode}');
      debugPrint('postCadastro response->${response.body}');

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['success'].toString() == 'true') {
        Controller.usuarioLogado = UsuarioObj(json: jsonData);
        (await SharedPreferences.getInstance()).setString('token', Controller.usuarioLogado!.token!.toString());
        return 'true';

      } else {
        return jsonData['message'].toString();
      }

    } catch (error) {
      debugPrint('erro postLogin: $error');

      return 'catch';
    }
  }
}