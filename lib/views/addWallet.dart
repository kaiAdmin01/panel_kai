import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/walletController.dart';
import 'home_page.dart';


class AddWallet extends StatefulWidget {
  AddWallet({Key? key}) : super(key: key);

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
   TextEditingController _walletController = new TextEditingController(); 

  WalletController walletController = Get.put(WalletController()); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

   backgroundColor: Color(0xff15202B),
      appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('add wallet', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),


      body: SafeArea(child: Column(children: [
        
            SizedBox(height: 20),
            Text(
              'Enter new wallet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.white), //
              controller: _walletController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'New Task',
                border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)
              )
                
              ),
            ),
            SizedBox(height: 20),
        ElevatedButton(
             style: ElevatedButton.styleFrom(
    primary: Colors.green, // Set the background color to green
    onPrimary: Colors.white, // Set the text color to white
    minimumSize: Size(double.infinity, 50), // Increase the height of the button
  ),
              onPressed: ()async {
               await  walletController.createWallet(_walletController.text, "here come the qr code el tasswira link ye aziz");
              Get.to(()=>HomePage()); 
               Get.snackbar("success", "wallet posted successfully"); 

              },
              child: Text('create Wallet (note that you have to delete the other wallet first)'),
            ),
      ],)),

    );
  }
}