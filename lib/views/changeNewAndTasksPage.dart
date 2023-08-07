



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai_admin_panel/controllers/postController.dart';

class TaskAndNewsChanges extends StatefulWidget {
  TaskAndNewsChanges({Key? key}) : super(key: key);

  @override
  State<TaskAndNewsChanges> createState() => _TaskAndNewsChangesState();
}

class _TaskAndNewsChangesState extends State<TaskAndNewsChanges> {
  PostController postController  = Get.put(PostController()); 
   TextEditingController _newsController = TextEditingController();
  TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff15202B),
      appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('Send Notifications', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
           
            
            SizedBox(height: 20),
            Text(
              'Enter New Task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white), //
              controller: _taskController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'New Task',
                border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)
              )
                
              ),
            ),
            SizedBox(height: 20),
           postController.PostLoading.value ? Center(child: CircularProgressIndicator(color: Colors.white,)):  ElevatedButton(
             style: ElevatedButton.styleFrom(
    primary: Colors.green, // Set the background color to green
    onPrimary: Colors.white, // Set the text color to white
    minimumSize: Size(double.infinity, 50), // Increase the height of the button
  ),
              onPressed: ()async {
               await  postController.CreateNewPost( _taskController.text);
               Get.snackbar("success", "task posted successfully"); 

              },
              child: Text('add task'),
            ),
          ],
        ),
      ),
    );
  }
}