

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai_admin_panel/controllers/postController.dart';
class FetchTasksPage extends StatefulWidget {
 const  FetchTasksPage({Key? key}) : super(key: key);

  @override
  State<FetchTasksPage> createState() => _FetchTasksPageState();
}

class _FetchTasksPageState extends State<FetchTasksPage> {
  PostController postController = Get.put(PostController()); 
  @override
  void initState() {
    // TODO: implement initState
    postController.fetchPosts(); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:  Color(0xff15202B),
      appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('tasks', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Obx(
                        ()=> postController.isDataLoaded.value ? Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
                          itemCount: postController.posts!.data!.length ,
                          itemBuilder: (context, index) {
                       

                return postController.isDataLoaded.value ? Center(child: Text("No users yet",style : TextStyle(color: Colors.white, fontSize: 50),),):  Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 20,
                    color: Color(0xff15202B),
                      child: InkWell(
                         hoverColor: Color(0xff15202B).withOpacity(0.9),
                        onTap: ()async  {
 
                     
                      
                        
                          },
                        child: Container(
                      
                          child: ListTile(
                            
                                 leading: Icon(
  Icons.list, // Choose the appropriate deposit icon
  size: 50, 
  color: Colors.green,// Adjust the size to your desired size
),

                            title: Text(index.toString(), style: TextStyle(color: Colors.white),),
                            subtitle: Text(postController.posts!.data![index].task.toString(), style : TextStyle(color: Colors.white, fontFamily: "inter", fontSize: 20, fontWeight: FontWeight.w300)),
                            trailing: IconButton(         
                              icon:  postController.deleteLoad.value  ? CircularProgressIndicator(): Icon(Icons.delete,color: Colors.red,
                              ), 
                                onPressed: () async{  
  
                                await   postController.deletePost(postController.posts!.data![index].sId.toString()); 
                                await postController.fetchPosts(); 
                                },
                               ),

                          ),
                        ),
                      ),
                    ),
                );
                          },
                        ),
                      ),

      

    ); 
  }
}