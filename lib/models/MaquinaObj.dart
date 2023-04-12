
import 'package:ofc2/utils/StringUtils.dart';

class MaquinaObj{
  String? nome;
  String? token;

  MaquinaObj({Map<String, dynamic>? json}) {
    if (json != null) {
      fromJson(json);
    }
  }

  fromJson(Map<String, dynamic> json) {
    nome =  StringUtils.checkNull(possibleNull: json['nome'].toString());
    token = StringUtils.checkNull(possibleNull: json['token'].toString());
  }
}