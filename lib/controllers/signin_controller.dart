

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kai_admin_panel/views/home_page.dart';

import '../models/user_model.dart';

class SignInController extends GetxController{
 User? admin ; 
 RxString loginResponse = "".obs ; 
  RxString id = "".obs ; 
  RxBool load = false.obs ; 
  // Method to log in a user
  Future<void> loginUser(String email, String password) async {
    final apiUrl = 'http://162.19.79.228/api/auth/login/admin'; // Replace with your API endpoint

    try {
      load.value = true ; 
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
           'content-type' : 'application/json',
         },
        
        body: jsonEncode({
          'email': email,
          'password': password,
   
        }),
      );

      // Handle different response statuses
      if (response.statusCode == 200) {
        // Login successful
        final data = jsonDecode(response.body);
         id.value = data['id'];
         print(id.value);
         
         admin = User.fromJson(data);
        
        Get.to(HomePage());
      } else if (response.statusCode == 400) {
        // Login failed
        final data = jsonDecode(response.body);
        final message = data['message'];
        loginResponse.value = message.toString();
        Get.snackbar("failed", "${loginResponse.value}") ; 
      } else {
        // Unexpected error
        loginResponse.value = 'failed to login try again';
          Get.snackbar("failed", "${loginResponse.value}") ; 
      }
    } catch (e) {
      // Exception occurred during login
      loginResponse.value = '$e';
        Get.snackbar("failed", "${loginResponse.value}") ; 
    }finally{
      load.value = false ; 
    }
  }

Future<String> getUserPhotoPath(String userId) async {
  final apiUrl = 'http://162.19.79.228/api/user/id/$userId'; // Replace with your API endpoint

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data != null && data.containsKey("photo")) {
        final photoPath = data["photo"];
        print(photoPath);
        return photoPath;
      } else {
        throw Exception('Photo path not found in the API response');
      }
    } else {
      throw Exception('Failed to load user');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}



  
}