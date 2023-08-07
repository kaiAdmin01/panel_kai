
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kai_admin_panel/models/wallet_model.dart';

class WalletController extends GetxController {

  Wallet? wallet ; 
  RxBool isLoading = false.obs ; 
  RxBool postLoading = false.obs; 
  RxBool deleteLoading = false.obs;
   // Create a wallet by making a POST request

 Future<Wallet?> createWallet( String wallet, String qrCode) async {
    try{
     postLoading(true); 
      final Map<String, dynamic> requestData = {
      "wallet": wallet,
      "qrCode": qrCode,
    };

    final response = await http.post(
      Uri.parse("http://162.19.79.228/api/admin/wallet"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 201) {
      return Wallet.fromJson(json.decode(response.body));
    } else {
      return null; // Return null if the creation was unsuccessful
    }


    }catch(err){
      print(err); 
    }finally{
        postLoading(false); 
    }
    }

    // Get a wallet by its ID from the server
  

   fetchWallet() async {
    try{
      isLoading(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/wallet'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 201) {
      var jsonData = json.decode(response.body) ;
      wallet = Wallet.fromJson(jsonData);
      
     
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
    isLoading(false); 
    }
    
  }

  // delete the wallet
   // Delete all wallets from the server
 Future<void> deleteAllWallets(String id) async {
  try {
    deleteLoading(true); // Show loading indicator before the request

    final response = await http.delete(Uri.parse("http://162.19.79.228/api/admin/wallet/$id"));

    if (response.statusCode == 200) {
      // Successful delete
      print("Wallet deleted successfully");
      // You can perform any additional actions or show a success message if needed.
    } else {
      // Failed to delete wallet
      print("Failed to delete wallet");
      // You can handle the error here or show an error message.
    }
  } catch (err) {
    // Network or other error occurred
    print(err);
    // You can handle the error here or show an error message.
  } finally {
    deleteLoading(false); // Hide loading indicator after the request, regardless of success or failure
  }
}


}