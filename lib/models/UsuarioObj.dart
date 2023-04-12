import 'package:ofc2/utils/StringUtils.dart';

class UsuarioObj {
  String? nome;
  String? token;

  UsuarioObj({Map<String, dynamic>? json}) {
    if (json != null) {
      fromJson(json);
    }
  }

  fromJson(Map<String, dynamic> json) {
    nome =  StringUtils.checkNull(possibleNull: json['nome'].toString());
    token = StringUtils.checkNull(possibleNull: json['token'].toString());
  }
}