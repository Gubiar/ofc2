import 'package:flutter/material.dart';
import 'package:ofc2/controller/Controller.dart';
import 'package:ofc2/models/MaquinaObj.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {

  @override
  void initState() {
    Controller.lstMaquinas.clear();
    for(int i = 0; i<5; i++){
      Map<String, dynamic> m = {};
      m["nome"] = "Maquina $i";
      m["codigo"] = i;
      m["nomeOperador"] = "Operador $i";
      m["idIot"] = "IOT A$i";
      i != 2 ? m["status"] = "Ativa" : m["status"] = "Desligada";
      
      Controller.lstMaquinas.add(MaquinaObj(json: m));
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Painel"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {},
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: Controller.lstMaquinas.length,
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        itemBuilder: (BuildContext context, int index) {
          return getVisualMaquina(cadaMaquina: Controller.lstMaquinas[index], context: context);
        }
      ),
    );
  }

  Widget getVisualMaquina({required BuildContext context, required MaquinaObj cadaMaquina}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        right: 20,
        left: 20
      ),
      margin: const EdgeInsets.only(
        bottom: 20
      ),
      decoration: BoxDecoration(
        color: cadaMaquina.status == "Ativa" ?  const Color(0xff1c193d) : const Color(0xFFFF0000),
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
                      fontSize: 12
                    ),
                  ),

                  Text(
                    cadaMaquina.nome!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
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
                        fontSize: 12
                    ),
                  ),

                  Text(
                    cadaMaquina.status!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
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
                        fontSize: 12
                    ),
                  ),

                  Text(
                    cadaMaquina.nomeOperador!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
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
                        fontSize: 12
                    ),
                  ),

                  Text(
                    cadaMaquina.idIot!.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
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
                        fontSize: 12
                    ),
                  ),

                  Text(
                    cadaMaquina.codigo!.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                ],
              ),


            ],
          ),

        ],
      ),
    );
  }
}
