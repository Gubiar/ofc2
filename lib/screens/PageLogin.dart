import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofc2/rest/auth/Auth.dart';
import 'package:ofc2/screens/PageHome.dart';
import 'package:ofc2/screens/PageCadastro.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

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
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Usuário',
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
                        controller: senhaController,
                        obscureText: isObscure.value,
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
                      ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if(emailController.text.isEmpty || senhaController.text.isEmpty){
                      Get.snackbar('login Inválido!', 'Preencha todos os campos');
                    } else {
                      isLoading.value = true;
                      String retorno = await Auth.postLogin(emailController.text, senhaController.text);
                      isLoading.value = false;
                      if(retorno == "true"){
                        Get.offAllNamed('/PageHome');
                      } else if(retorno == 'catch'){
                        Get.snackbar('Erro no login!', "Não foi possível validar o login.");
                      } else {
                        Get.snackbar('Dados incorretos!', retorno);
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
                    child: Obx(() => ((isLoading.value) ? CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3,

                    ) : const Text(
                      'Entrar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                      ),
                    ))),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                TextButton(
                    onPressed: () => Get.offAllNamed("/PageCadastro"),
                    child: const Text(
                      "Não tem conta? Clique aqui",
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
