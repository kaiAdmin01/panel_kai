

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminRegisterController extends GetxController{
RxBool loadingPass = false.obs ; 

//
Future<void> registerUser(String username, String email, String password) async {
  // API endpoint for user registration
  final url = Uri.parse('http://162.19.79.228/api/auth/register'); // Replace with your actual API URL

  // Create the request body
  final Map<String, dynamic> requestBody = {
    'username': username,
    'email': email,
    'password': password,
    'isAdmin' : true,
    'pays':""
  };

  try {
    loadingPass(true); 
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      // Registration successful, handle the response here if needed
      print('User registered successfully!');
      Get.snackbar("success", "admin registered successfully!");
    } else {
      // Handle error response
      print('Failed to register user. Status code: ${response.statusCode}');
      Get.snackbar("failed", "${response.body}"); 
    }
  } catch (e) {
    // Handle network or server errors
    print('Error registering user: $e');
      Get.snackbar("failed", "${e}"); 
  }finally{
    loadingPass(false); 
  }
}
//


Future<void> updatePassword(String userId, String newPassword) async {
  final url = Uri.parse('http://162.19.79.228/api/user/${userId}'); // Replace with your actual API URL

  // Create the request body
  final Map<String, dynamic> requestBody = {
    'password': newPassword,
  };

  try {
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      // Update successful, handle the response here if needed
      print('Password updated successfully!');
      print(newPassword);
      Get.snackbar("success", "password updated");
    } else {
      // Handle error response
      print('Failed to update password. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network or server errors
    print('Error updating password: $e');
  }
}


}