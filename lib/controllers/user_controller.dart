

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../models/users_model.dart';

class UserController extends GetxController{
  int? nb ; 
  Users? users ; 
   List<Data> filteredUsers = []; 
  User? admins ; 
  User? user ; 
  RxBool isDataLoaded = false.obs ; 
  RxBool isDataLoaded2 = false.obs ; 
 DataUser? user1; 
fetchUsers() async {
    try{
      isDataLoaded(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/users'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      users = Users.fromJson(jsonData);
       if (users!.data != null) {
         filteredUsers = users!.data!.where((user) => user.isAdmin == true).toList();
         print(filteredUsers[1].email.toString());
        
      }
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
    isDataLoaded(false); 
    }
    
  }
  

 getUserById(String userId) async {
  final url = Uri.parse('http://162.19.79.228/api/admin/user/${userId}');

  try {
   
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final userData = jsonBody;


        
        user1 =  DataUser.fromJson(userData);
       int nb = (user1?.nbNotif ?? 0) + 1;
       print(user1?.nbNotif); 
       print(nb);

        
      
    }
  } catch (e) {
    print('Error retrieving user data: $e');
  }finally{
   
  }


}

  updateUserNotif(String id) async {
   await getUserById(id); 
    

 
    try{
   
    final url = 'http://162.19.79.228/api/admin/user/${id}'; // Replace with your API endpoint

  final Map<String, dynamic> requestData = {

    "nbNotif":(user1?.nbNotif ?? 0) + 1,
  };

  final jsonBody = json.encode(requestData);

  final response = await http.put(
    Uri.parse(url),
    headers: {
           'content-type' : 'application/json',
         },
    body: jsonBody,
  );

  if (response.statusCode == 200) {
    print('notif  updated successfully');
  } else {
    print('Failed to update notif. Status code: ${response.statusCode}');
  }


  }catch(err){
    print(err);
    print("haw zeby");
  }finally{
   
  }

  }

   updateUserNotifByCode(String unique) async {
   await getUserById(unique); 
    

 
    try{
   
    final url = 'http://162.19.79.228/api/admin/user/code/${unique}'; // Replace with your API endpoint

  final Map<String, dynamic> requestData = {

    "nbNotif":(user1?.nbNotif ?? 0) + 1,
  };

  final jsonBody = json.encode(requestData);

  final response = await http.put(
    Uri.parse(url),
    headers: {
           'content-type' : 'application/json',
         },
    body: jsonBody,
  );

  if (response.statusCode == 200) {
    print('notif  updated successfully');
  } else {
    print('Failed to update notif. Status code: ${response.statusCode}');
  }


  }catch(err){
    print(err);
    print("haw zeby");
  }finally{
   
  }

  }

}