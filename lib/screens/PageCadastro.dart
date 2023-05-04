import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/rest/auth/Auth.dart';
import 'package:ofc2/screens/PageHome.dart';
import 'package:ofc2/screens/PageCadastro.dart';

class PageCadastro extends StatefulWidget {
  const PageCadastro({Key? key}) : super(key: key);

  @override
  State<PageCadastro> createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {

  RxBool isObscure = true.obs;
  final emailController = TextEditingController();
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();
  final repetirSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: Get.width * 0.4,
                  fit: BoxFit.contain,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  child: Column(
                    children: [

                      TextField(
                        keyboardType: TextInputType.text,
                        controller: nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Obx(() => TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscure.value,
                        controller: senhaController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Senha',
                            suffixIcon: IconButton(
                              icon: Icon(
                                (isObscure.value)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                                color: const Color(0xff231942),
                              ),
                              onPressed: () =>
                              isObscure.value = !isObscure.value,
                            )),
                      )),

                      const SizedBox(
                        height: 20,
                      ),

                      Obx(() => TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isObscure.value,
                        controller: repetirSenhaController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Repetir Senha',
                            suffixIcon: IconButton(
                              icon: Icon(
                                (isObscure.value)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                                color: const Color(0xff231942),
                              ),
                              onPressed: () =>
                              isObscure.value = !isObscure.value,
                            )),
                      ))


                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if(nomeController.text.isEmpty || emailController.text.isEmpty || senhaController.text.isEmpty || repetirSenhaController.text.isEmpty){
                      Get.snackbar('Cadastro Inválido!', 'Todos os campos são obrigatórios');
                    } else if(senhaController.text != repetirSenhaController.text){
                      Get.snackbar('Dados incorretos', 'As senhas estão diferentes');
                    } else {

                      String mapToSend = '''
                    {
                      "name": "${nomeController.text}",
                      "email": "${emailController.text}",
                      "password": "${senhaController.text}",
                      "confirmPassword": "${repetirSenhaController.text}"
                    }
                    ''';

                      String retorno = await Auth.postCadastro(mapToSend.trim());

                      if(retorno == 'true'){
                        Get.offAllNamed('/PageHome');
                      } else if (retorno == 'catch'){
                        Get.snackbar('Erro ao cadastrar!', 'Não foi possível realizar o cadastro.');
                      }else {
                        Get.snackbar('Erro ao cadastrar!', retorno);
                      }
                    }
                  },
                  child: Container(
                    width: Get.width * 0.9,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black87,
                    ),
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                TextButton(
                    onPressed: () => Get.offAllNamed("/PageLogin"),
                    child: Text(
                      "Já é cadastrado? Faça o login",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                )
              ]),
        ),
      ),
    );
  }
}
