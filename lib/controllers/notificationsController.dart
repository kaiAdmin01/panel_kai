


import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kai_admin_panel/models/user_model.dart';
class NotificationsController extends GetxController{
  
RxBool userLoad = false.obs; 
DataUser? user2 ; 
RxBool notificationLoad = false.obs ; 
List<dynamic?>? userNotif ;  
  @override
    void onInit(){
     
      super.onInit();
      
    }
     
 getUserByCode(String code) async {
  final url = Uri.parse('http://162.19.79.228/api/admin/user/userCode/${code}');

  try {
    userLoad.value = true ; 
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final userData = jsonBody;

      if (userData != null) {
        print(userData); 
        user2 =  DataUser.fromJson(userData);
        userNotif = user2?.notifications ; 
        print(userNotif); 
      }
    }
  } catch (e) {
    print('Error retrieving user data: $e');
  }finally{
    userLoad.value =false  ;
  }


}

    sendNotification(String uniqueCode, String notification)async {
      try{
        print(uniqueCode);
        notificationLoad.value = true ; 
       
       await  getUserByCode(uniqueCode); 
         List<dynamic?>? notifArray = user2!.notifications; 
List<String?> newArray = List<String>.from(userNotif?? [] )..add(notification);
print(newArray); 
    final url = 'http://162.19.79.228/api/admin/user/code/${uniqueCode}'; // Replace with your API endpoint

  final Map<String, dynamic> requestData = {

    "notifications" : newArray ,
  };

  final jsonBody = json.encode(requestData);

  final response = await http.put(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonBody,
  );

  if (response.statusCode == 200) {
    print('User notification updated successfully');
  } else {
    print('Failed to update user notifications. Status code: ${response.statusCode}');
  }


  }catch(err){
    print(err);
    print("here the eror");
  }finally{
   notificationLoad.value = false ; 
  }
           
    }
}