import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:ofc2/models/LinhaObj.dart';
import 'package:ofc2/rest/geral/RestGeral.dart';

class LinhasController extends GetxController {
  static RxList<LinhaObj> _lstLinhas = <LinhaObj>[].obs;

  static void pushItem(Map<String, dynamic>? item){
    _lstLinhas.add(LinhaObj(json: item));
  }

  static void setupList(Map<String, dynamic>? item){
    _lstLinhas.clear();
    for(dynamic cada in item!["linhas"]){
      log('cada linha -> $cada');
      _lstLinhas.add(LinhaObj(json: cada));
    }
  }

  static void cleanList(){
    _lstLinhas.clear();
  }

  static RxList<LinhaObj> get getList => _lstLinhas;

  static set setList(RxList<LinhaObj> lst) {
    _lstLinhas.clear();
    _lstLinhas.value = List.from(lst);
  }

  static Future<void> changeStatusLinha(String codigo, String status) async{
    String retorno = await RestGeral.changeStatusLinha(codigo, status);

    if(!Get.isSnackbarOpen){
      if(retorno == 'true'){
        Get.snackbar('Sucesso', 'Linha atualizada');
      } else if (retorno == 'catch'){
        Get.snackbar('Erro', 'Não foi possível realizar a operação');
      } else{
        Get.snackbar('Erro', retorno);
      }
    }
  }
}