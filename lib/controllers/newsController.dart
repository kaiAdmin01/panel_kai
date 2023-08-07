

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/newsModel.dart';

class NewsController extends GetxController{

  RxBool loading = false.obs ;
  RxBool Deleteloading = false.obs ;  
  Images? news ; 
  
//------------
 fetchPosts() async {
    try{
      loading(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/image'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      news = Images.fromJson(jsonData);
     
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
    loading(false); 
    }
    
  }
//

 Future<void> deletePost(String id)async {
      final url = Uri.parse('http://162.19.79.228/api/image/${id}');

      try{
        Deleteloading(true) ; 
        final response = await http.delete(
      url,
      headers: {
           'content-type' : 'application/json',
         }

    );
    print(response.body);
     if (response.statusCode == 200) {
      print('Post deleted successfully');
    } else {
      print('Failed to delete the post: ${response.statusCode}');
    }
      }catch(error){
        print(error); 
      }finally{
        Deleteloading(false); 
      }



  }

}