
import 'package:ofc2/utils/StringUtils.dart';

class MaquinaObj{
  String? nome;
  String? codigo;
  String? nomeOperador;
  String? idIot;
  String? status; //1 = OK | 2 = Atenção | 3 = Manutenção
  

  MaquinaObj({Map<String, dynamic>? json}) {
    if (json != null) {
      fromJson(json);
    }
  }

  fromJson(Map<String, dynamic> json) {
    nome =  StringUtils.checkNull(possibleNull: json['nome'].toString());
    codigo =  StringUtils.checkNull(possibleNull: json['id'].toString());
    nomeOperador =  StringUtils.checkNull(possibleNull: json['nomeOperador'].toString());
    idIot =  StringUtils.checkNull(possibleNull: json['iotUUID'].toString());
    status =  StringUtils.checkNull(possibleNull: json['status'].toString());
  }
}