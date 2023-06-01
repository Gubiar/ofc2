import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:ofc2/models/MaquinaObj.dart';
import 'package:ofc2/rest/geral/RestGeral.dart';

class MaquinasController extends GetxController {
  static RxList<MaquinaObj> _lstMaquinas = <MaquinaObj>[].obs;

  static void pushItem(Map<String, dynamic>? item){
    _lstMaquinas.add(MaquinaObj(json: item));
  }

  static void setupList(Map<String, dynamic>? item){
    _lstMaquinas.clear();
    for(dynamic cada in item!["maquinas"]){
      _lstMaquinas.add(MaquinaObj(json: cada));
    }
  }

  static void cleanList(){
    _lstMaquinas.clear();
  }

  static RxList<MaquinaObj> get getList => _lstMaquinas;

  static set setList(RxList<MaquinaObj> lst) {
    _lstMaquinas.clear();
    _lstMaquinas.value = List.from(lst);
  }

  static Future<void> changeStatusMaquina(String codigo, String status) async{
    String retorno = await RestGeral.changeStatusMaquina(codigo, status);

    if(!Get.isSnackbarOpen){
      if(retorno == 'true'){
        Get.snackbar('Sucesso', 'Máquina atualizada');
      } else if (retorno == 'catch'){
        Get.snackbar('Erro', 'Não foi possível realizar a operação');
      } else{
        Get.snackbar('Erro', retorno);
      }
    }
  }
}