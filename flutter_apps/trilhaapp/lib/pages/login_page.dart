import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController(text: '');
  var senhaController = TextEditingController(text: '');
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          flex: 8,
                          child: Image.network(
                            "https://static.wixstatic.com/media/7a378f_5140deabd7d040378d740069cb692b87~mv2.png/v1/crop/x_0,y_10,w_1334,h_493/fill/w_568,h_208,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo%20DIO.png",
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Já tem cadastro?',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Faça seu login e make the change_',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: emailController,
                        onChanged: (value) {
                          debugPrint(value);
                        },
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(top: -1),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple)),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.purple,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 30,
                        alignment: Alignment.center,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          obscureText: isObscureText,
                          controller: senhaController,
                          onChanged: (value) {
                            debugPrint(value);
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(top: -1),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)),
                              focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple)),
                              hintText: 'Senha',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.purple,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isObscureText = !isObscureText;
                                  });
                                },
                                child: Icon(
                                  isObscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              )),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              if (emailController.text.trim() ==
                                      'email@email.com' &&
                                  senhaController.text.trim() == '123') {
                                /*  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Login efetuado com sucesso!'))); */
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainPage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Erro ao efetuar o login.')));
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.purple)),
                            child: const Text(
                              'ENTRAR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                            color: Colors.amber, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
