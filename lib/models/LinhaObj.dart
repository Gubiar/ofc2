
import 'package:ofc2/models/MaquinaObj.dart';
import 'package:ofc2/utils/StringUtils.dart';

class LinhaObj{
  String? nome;
  String? codigo;
  List<MaquinaObj>? lstMaquinas = [];


  LinhaObj({Map<String, dynamic>? json}) {
    if (json != null) {
      fromJson(json);
    }
  }

  fromJson(Map<String, dynamic> json) {
    nome =  StringUtils.checkNull(possibleNull: json['nome'].toString());
    codigo =  StringUtils.checkNull(possibleNull: json['id'].toString());
    if(json['maquinas'] != null){
      lstMaquinas?.clear();
      for(dynamic cada in json['maquinas']){
        lstMaquinas?.add(MaquinaObj(json: cada));
      }
    }
  }
}