import 'package:get/get.dart';
import 'package:ofc2/models/MaquinaObj.dart';

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
}