import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/controller/Controller.dart';
import 'package:ofc2/controller/MaquinasController.dart';
import 'package:ofc2/models/MaquinaObj.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Painel"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offAllNamed('/PageLogin'),
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: MaquinasController.getList.value.length,
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          itemBuilder: (BuildContext context, int index) {
            return Obx(() => getVisualMaquina(
                cadaMaquina: MaquinasController.getList[index],
                context: context));
          }),
    );
  }

  Widget getVisualMaquina(
      {required BuildContext context, required MaquinaObj cadaMaquina}) {
    return InkWell(
      //Quando apertado
      onTap: () {
        print("Maquina " + cadaMaquina.codigo!.toString() + " Selecionada");
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: const Text('Confirme sua ação'),
                content: const Text('Você deseja desligar todas as maquinas?'),
                actions: [
                  // Sim
                  TextButton(
                      onPressed: () {
                        // Remove the box
                        setState(() {
                          print("Sim");
                        });

                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Desligar maquinas')),
                  TextButton(
                      onPressed: () {
                        print("Não");
                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'))
                ],
              );
            });
      },
      //Container
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: getStatusColor(cadaMaquina.status!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Identificação',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    Text(
                      cadaMaquina.nome!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    Text(
                      getStatusName(cadaMaquina.status!),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Operador',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    Text(
                      cadaMaquina.nomeOperador!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'IOT',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    Text(
                      cadaMaquina.idIot!.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Codigo',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    Text(
                      cadaMaquina.codigo!.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color getStatusColor(String status){
    if(status == "1"){
      return Colors.green;
    } else if(status == "2"){
      return Colors.orange;
    }else {
      return Colors.red;
    }
  }

  String getStatusName(String status){
    if(status == "1"){
      return "OK";
    } else if(status == "2"){
      return "Atenção";
    }else {
      return "Manutenção";
    }
  }
}
