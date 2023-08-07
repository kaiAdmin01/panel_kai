
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai_admin_panel/controllers/newsController.dart';
class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    // TODO: implement initState
    newsController.fetchPosts(); 
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
                        ()=> newsController.loading.value ? Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
                          itemCount: newsController.news!.data!.length ,
                          itemBuilder: (context, index) {
                return newsController.loading.value ? Center(child: Text("No users yet",style : TextStyle(color: Colors.white, fontSize: 50),),):  Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 300,
                    child: Card(        
                      elevation: 20,
                      color: Color(0xff15202B),
                        child: InkWell(
                           hoverColor: Color(0xff15202B).withOpacity(0.9),
                          onTap: ()async  {

                            },
                          child: Container(
                            height: 300,
                        
                            child: ListTile(
                              
                                   leading: Icon(
                    Icons.newspaper, // Choose the appropriate deposit icon
                    size: 50, 
                    color: Colors.green,// Adjust the size to your desired size
                  ),
                  
                              title: Image.network(newsController.news!.data![index].image.toString(), fit: BoxFit.fitHeight,),
                            
                              trailing: IconButton(         
                                icon:  Icon(Icons.delete,color: Colors.red,
                                ), 
                                  onPressed: () async{  
                    
                                  await   newsController.deletePost(newsController.news!.data![index].sId.toString()); 
                                  print(newsController.news!.data![index].sId.toString());
                                  await newsController.fetchPosts(); 
                                  Get.snackbar("deleted", "news deleted successfully");
                                  },
                                 ),
                  
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