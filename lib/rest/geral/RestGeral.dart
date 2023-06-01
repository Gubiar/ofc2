import 'package:http/http.dart' as http;
import 'package:ofc2/controller/Controller.dart';
import 'package:ofc2/models/UsuarioObj.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class RestGeral{

  static Future<String> changeStatusMaquina(String codigo, String status) async {

    String mapToSend = '{"codigo":"$codigo","status":"$status"}';
    debugPrint('changeStatusMaquina body $mapToSend');

    try {
      http.Response response = await http.post(
        Uri.parse('${Controller.url}changeStatusMaquina'),
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

      debugPrint('changeStatusMaquina CODE-> ${response.statusCode}');
      debugPrint('changeStatusMaquina response->${response.body}');

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['success'].toString() == 'true') {
        return 'true';
      } else {
        return jsonData['message'].toString();
      }
    } catch (error) {
      debugPrint('erro postLogin: $error');
      return 'catch';
    }
  }

  static Future<String> changeStatusLinha(String codigo, String status) async {

    String mapToSend = '{"codigo":"$codigo","status":"$status"}';
    debugPrint('changeStatusLinha body $mapToSend');

    try {
      http.Response response = await http.post(
        Uri.parse('${Controller.url}changeStatusLinha'),
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

      debugPrint('changeStatusLinha CODE-> ${response.statusCode}');
      debugPrint('changeStatusLinha response->${response.body}');

      Map<String, dynamic> jsonData = json.decode(response.body);

      if (jsonData['success'].toString() == 'true') {
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