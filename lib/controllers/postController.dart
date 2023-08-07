

import 'dart:convert';

import 'package:get/get.dart';
  import 'package:http/http.dart' as http;

import '../models/post_model.dart';
class PostController extends GetxController{

RxBool PostLoading = false.obs ; 
RxBool taskLoading = false.obs ; 
RxBool isDataLoaded = false.obs; 
RxBool deleteLoad = false.obs  ;
Posts? posts ; 

Future<void> CreateNewPost( String task) async {
  final url = Uri.parse('http://162.19.79.228/api/post');

  try {
    PostLoading(true); 
    final response = await http.post(
      url,
      body: {
      
        'task' : task
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Post posted successfully');
    } else {
      print('Failed to post the post: ${response.statusCode}');
    }
  } catch (error) {
    print('Error updating tesk : $error');
  }finally{
    PostLoading(false); 
  }
}
//------------
 fetchPosts() async {
    try{
      isDataLoaded(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/post/posts/all'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      posts = Posts.fromJson(jsonData);
     
    
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


  Future<void> deletePost(String postId)async {
      final url = Uri.parse('http://162.19.79.228/api/post/${postId}');

      try{
        deleteLoad(true) ; 
        final response = await http.delete(
      url,
      headers: {
           'content-type' : 'application/json',
         }

    );
     if (response.statusCode == 200) {
      print('Post deleted successfully');
    } else {
      print('Failed to delete the post: ${response.statusCode}');
    }
      }catch(error){
        print(error); 
      }finally{
        deleteLoad(false); 
      }



  }

}