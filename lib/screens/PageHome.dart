import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/controller/Controller.dart';
import 'package:ofc2/controller/LinhasController.dart';
import 'package:ofc2/controller/MaquinasController.dart';
import 'package:ofc2/models/LinhaObj.dart';
import 'package:ofc2/models/MaquinaObj.dart';
import 'package:ofc2/rest/geral/RestGeral.dart';

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

  RxBool isLinhas = true.obs;

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
      body: Obx(() => Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => {isLinhas.value = true},
                    child: Container(
                      width: Get.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      color: isLinhas.value ? Colors.blue : Colors.white,
                      child: Text(
                        'Linhas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isLinhas.value ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {isLinhas.value = false},
                    child: Container(
                      width: Get.width / 2,
                      height: 40,
                      alignment: Alignment.center,
                      color: !isLinhas.value ? Colors.blue : Colors.white,
                      child: Text(
                        'Maquinas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:
                              !isLinhas.value ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (isLinhas.value)
                Expanded(
                    child: ListView.builder(
                        itemCount: LinhasController.getList.value.length,
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 20),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() => getVisualLinha(
                              cadaLinha: LinhasController.getList[index],
                              context: context));
                        })),
              if (!isLinhas.value)
                Expanded(
                    child: ListView.builder(
                        itemCount: LinhasController.getList.value.length,
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 20),
                        itemBuilder: (BuildContext context, int index) {
                          return Obx(() => Column(
                                children: [
                                  for (MaquinaObj cada in LinhasController
                                      .getList[index].lstMaquinas!)
                                    getVisualMaquina(
                                        context: context, cadaMaquina: cada)
                                ],
                              ));
                        })),
            ],
          )),
    );
  }

  Widget getVisualLinha(
      {required BuildContext context, required LinhaObj cadaLinha}) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cadaLinha.nome!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () async => {
                  await LinhasController.changeStatusLinha(
                      cadaLinha.codigo!, '1')
                },
                child: Container(
                  width: Get.width / 3 - 40,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: const Text(
                    'Ativa',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () async => {
                  await LinhasController.changeStatusLinha(
                      cadaLinha.codigo!, '2')
                },
                child: Container(
                  width: Get.width / 3 - 40,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: const Text(
                    'Atenção',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () async => {
                  await LinhasController.changeStatusLinha(
                      cadaLinha.codigo!, '3')
                },
                child: Container(
                  width: Get.width / 3 - 40,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  alignment: Alignment.center,
                  child: const Text(
                    'Manutenção',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: Get.width,
            height: 1,
            margin: EdgeInsets.only(top: 15),
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 20,
          ),
          for (MaquinaObj cada in cadaLinha.lstMaquinas!)
            getVisualMaquina(context: context, cadaMaquina: cada),
        ],
      ),
    );
  }

  Widget getVisualMaquina(
      {required BuildContext context, required MaquinaObj cadaMaquina}) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(3, 3))
      ], borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              color: getStatusColor(cadaMaquina.status!),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
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
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async => {
                    await MaquinasController.changeStatusMaquina(
                        cadaMaquina.codigo!, '1')
                  },
                  child: Container(
                    width: Get.width / 3 - 40,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Ativa',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async => {
                    await MaquinasController.changeStatusMaquina(
                        cadaMaquina.codigo!, '2')
                  },
                  child: Container(
                    width: Get.width / 3 - 40,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Atenção',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async => {
                    await MaquinasController.changeStatusMaquina(
                        cadaMaquina.codigo!, '3')
                  },
                  child: Container(
                    width: Get.width / 3 - 40,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: const Text(
                      'Manutenção',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color getStatusColor(String status) {
    if (status == "1") {
      return Colors.green;
    } else if (status == "2") {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getStatusName(String status) {
    if (status == "1") {
      return "OK";
    } else if (status == "2") {
      return "Atenção";
    } else {
      return "Manutenção";
    }
  }
}
