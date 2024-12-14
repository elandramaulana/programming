import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming/controller/auth_controller.dart';

class HomePage extends StatelessWidget {
  final AuthController authController = Get.find();
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.logout),
          onPressed: (){
            authController.logout();
          },),
        ],
      ),
    
    );
  }
}