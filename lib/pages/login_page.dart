import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming/controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email'
              )
            ),

            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password'
              )
            ),

            const SizedBox(
              height: 20.0,
            ),

            Obx(() => authController.isLoading.value ?
            const CircularProgressIndicator() :
            ElevatedButton(onPressed: (){
              authController.login(_emailController.text, _passwordController.text);
            }, child: const Text(
              'Login'
            ))
                
            )
            
          ],
        ),
      ),
    );
  }
}