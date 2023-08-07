import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_web/image_picker_web.dart';

class AddNews extends StatefulWidget {
  AddNews({Key? key}) : super(key: key);

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  html.FileUploadInputElement? _fileUploadInputElement;
  bool load = false ; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xff15202B),
      appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('News', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           load ?  CircularProgressIndicator(color: Colors.white,) : ElevatedButton(
              onPressed: () async {
                // Show the file picker dialog
                final html.FileUploadInputElement input = html.FileUploadInputElement()..accept = 'image/*';
                input.click();

                // Wait for the file to be picked
                input.onChange.listen((event) {
                  final html.File file = input.files!.first;
                  _uploadImage(file);
                });
               
              },
              child: const Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadImage(html.File file) async {
    try {
   load = true ; 
      final reader = html.FileReader();
      reader.onLoadEnd.listen((event) async {
        final Uint8List data = reader.result as Uint8List;
        final blob = html.Blob([data]);

        // Create a multipart request to the server endpoint for image upload
        final request = http.MultipartRequest(
          'POST',
          Uri.parse('http://162.19.79.228/api/image'), // Replace with your server's endpoint
        );

        // Attach the Blob to the request
        final fileStream = Stream.fromIterable([data]);
        final multipartFile = http.MultipartFile('images', fileStream, data.length, filename: file.name);
        request.files.add(multipartFile);

        // Send the request and get the response
        final response = await http.Response.fromStream(await request.send());
        if (response.statusCode == 200) {
          final responseJson = json.decode(response.body);
          // Here, you can process the response from the server or display a success message
          print('Upload successful. Server response: $responseJson');
        } else {
          // Handle error
          print('Error uploading image. Status code: ${response.statusCode}');
        }
      });

      // Read the contents of the file
      reader.readAsArrayBuffer(file);
    } catch (err) {
      // Handle error
      print('Error uploading image: $err');
    }finally{
      load = false ; 
       Get.snackbar("success","news posted");
    }
  }
}
