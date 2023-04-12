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
    // TODO: implement initState
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
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            'Maquina 1',
          )

        ],
      ),
    );
  }
}
