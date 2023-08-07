
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai_admin_panel/controllers/user_controller.dart';

class AdminsPage extends StatefulWidget {
  AdminsPage({Key? key}) : super(key: key);

  @override
  State<AdminsPage> createState() => _AdminsPageState();
}

class _AdminsPageState extends State<AdminsPage> {

  UserController userController = Get.put(UserController()); 
  @override
  void initState() {
    // TODO: implement initState
    userController.fetchUsers();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('admins', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff15202B),
      body: Center(
        child: Obx(
          ()=> userController.isDataLoaded.value ? Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
            itemCount: userController.filteredUsers.length ?? 0,
            itemBuilder: (context, index) {
              return userController.filteredUsers.length== 0  ? Center(child: Text("", style: TextStyle(color: Colors.white),),) : Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 20,
                  color: Color(0xff15202B),
                    child: InkWell(
                       hoverColor: Color(0xff15202B).withOpacity(0.9),
                     
                      child: Container(
                    
                        child: ListTile(
                                            
                          title: Text(userController.filteredUsers[index].username.toString(), style: TextStyle(color: Colors.white),),
                          subtitle: Text(userController.filteredUsers[index].email.toString(), style : TextStyle(color: Colors.white)),
                          trailing:Text("admin") ,
                        ),
                      ),
                    ),
                  ),
              );
            },
          ),
        ),
      ),
    
      
    );
  }
}