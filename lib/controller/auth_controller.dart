import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:programming/pages/home_page.dart';
import 'package:programming/pages/login_page.dart';

class AuthController{

  final box = GetStorage();
  var isLoading = false.obs;
  
  Future<void> login(String email, String password) async{
    isLoading(true);
    final url = Uri.parse('https://reqres.in/api/login');
    
    
    try {
        final response = await http.post(
      url,
      headers: {'Content-type' : 'application/json'},
      body: json.encode({
        'email' : email, 
        'password' : password
        }),
       );
       
       if(response.statusCode == 200){
        final data = json.decode(response.body);
        final token = data['token'];

        await saveToken(token);

        Get.offAll(HomePage());
       }else{
        throw Exception('Failed to Login');
       }
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    }finally{
      isLoading(false);
    }
  }


  Future<void> saveToken(String token) async{
    await box.write('token', token);
  }

  String? getToken(){
    return box.read('token');
  }

  void checkToken(){
    final token = getToken();
    if(token != null){
      Get.offAll(HomePage());
    }else{
      Get.offAll(LoginPage());
    }
  }

  Future<void>logout()async{
    await box.remove('token');
    Get.offAll(LoginPage());
  }
}