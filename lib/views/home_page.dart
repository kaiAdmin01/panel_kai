import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai_admin_panel/controllers/signin_controller.dart';
import 'package:kai_admin_panel/models/wallet_model.dart';
import 'package:kai_admin_panel/views/addWallet.dart';
import 'package:kai_admin_panel/views/add_news.dart';
import 'package:kai_admin_panel/views/admins.dart';
import 'package:kai_admin_panel/views/deposits_page.dart';
import 'package:kai_admin_panel/views/done_transactions.dart';
import 'package:kai_admin_panel/views/newsPage.dart';
import 'package:kai_admin_panel/views/notifications_page.dart';
import 'package:kai_admin_panel/views/fetchTasks.dart';
import 'package:kai_admin_panel/views/registerAdmin.dart';
import 'package:kai_admin_panel/views/updatePass.dart';
import 'package:kai_admin_panel/views/users_page.dart';
import 'package:kai_admin_panel/views/wallet_page.dart';
import 'package:kai_admin_panel/views/withdrawal_page.dart';

import 'changeNewAndTasksPage.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
   SignInController signInController = Get.put(SignInController()); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15202B), 
      key: _scaffoldKey,
     appBar: AppBar(
 leading: IconButton( color: Colors.white, onPressed: (){_scaffoldKey.currentState?.openDrawer();}, icon: Icon(Icons.drag_handle_sharp,),),
         backgroundColor: Color(0xff15202B),
        title: Text('HomePage', style: TextStyle(color: Colors.white),),
        centerTitle: true,
     ),
      drawer: Drawer(
        backgroundColor:Color(0xff15202B),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          

          SizedBox(height: 100,), 
    Container(
  padding: EdgeInsets.only(left: 60),
  child: signInController.admin != null &&
         signInController.admin!.data != null &&
         signInController.admin!.data!.username != null
      ? Text(
          signInController.admin!.data!.username!,
          style: TextStyle(
            color: Colors.green,
            fontFamily: "inter",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        )
      : Text(
          "admin",
          style: TextStyle(
            color: Colors.green,
            fontFamily: "inter",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
),

            SizedBox(height: 60,), 

          TextButton(
      onPressed: () async{
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DepositsPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.money, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'deposits',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    


    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => withdrawlPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.wallet, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'withdrawal',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),

    TextButton(
      onPressed: () async{
      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.notification_add, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'Send Notifications',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminsPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.admin_panel_settings_sharp, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'admins',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    //
    
     TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskAndNewsChanges()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.post_add_rounded, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'add Task',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.newspaper, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'News page',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddWallet()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.post_add_outlined, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'add wallet',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
     TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoneTransactions()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.check_rounded, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'done deposits',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoneWithdrawl()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.check_box_sharp, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'done withdrawls',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
     TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FetchTasksPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.book, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'tasks',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.wallet, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'wallet',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UsersCountryPage()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.person_sharp, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'users',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNews()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.post_add, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'add news',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>RegisterAdmin()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.add_moderator_outlined, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'Add moderator',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    TextButton(
      onPressed: () async{
         Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>UpdatePass()),
              );
      },
      style: TextButton.styleFrom(
        primary: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 35,),
          Icon(Icons.update, color: Colors.white), // Replace icon_name with the desired icon
          SizedBox(width: 10),
          Text(
            'update password',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ),
    
        ]),
      ),
      
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
            InkWell(
              borderRadius: BorderRadius.circular(20),
              hoverColor: Colors.white.withOpacity(0.54),
              onTap: (){Get.to(()=> DepositsPage()); },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Card(
                  color: Color(0xff15202B),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Center(child: Text("navigate To deposits",style: TextStyle(color: Colors.white , fontFamily: "inter", fontWeight: FontWeight.bold, fontSize: 30),))),
                ),
              ),
            ),
        
            //
             InkWell(
              borderRadius: BorderRadius.circular(20),
              hoverColor: Colors.white.withOpacity(0.54),
              onTap: (){Get.to(()=> withdrawlPage()); },
              child: Container(
                padding: EdgeInsets.all(20),
                child: Card(
                  color: Color(0xff15202B),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Center(child: Text("navigate to withdrawals",style: TextStyle(color: Colors.white , fontFamily: "inter", fontWeight: FontWeight.bold, fontSize: 30),))),
                ),
              ),
            ),
          ],),
        )
      ),
      
    );
  }
}