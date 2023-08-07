import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai_admin_panel/controllers/transaction_controller.dart';

import 'package:kai_admin_panel/views/user_balance.dart';

import '../controllers/signin_controller.dart';




class DepositsPage extends StatefulWidget {
  DepositsPage({Key? key}) : super(key: key);

  @override
  State<DepositsPage> createState() => _DepositsPageState();
}

class _DepositsPageState extends State<DepositsPage> {

  TransactionController transactionController = Get.put(TransactionController()); 
   SignInController signInController = Get.put(SignInController()); 
   
  


  @override
  void initState() {
    // TODO: implement initState
     transactionController.fetchTreatedDepositTransactions(); 
     transactionController.fetchDepositTransactions(); 
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('deposits', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff15202B),
      body: 
      Container(
        padding: EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Column(
            children: [

                Text("pending Deposits", style: TextStyle(color: Colors.white , fontSize: 20, fontWeight: FontWeight.w500),),
              //
              Container(
                 width: 500,
                height: 600,
                child: Obx(
                        ()=> transactionController.isDataLoaded.value ? Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
                          itemCount: transactionController.deposits?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                       

                return  Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 20,
                    color: Color(0xff15202B),
                      child: InkWell(
                         hoverColor: Color(0xff15202B).withOpacity(0.9),
                        onTap: ()async  {
                      await transactionController.updateTransactionStatus(transactionController.deposits!.data![index].sId.toString(), "isGettingTreated") ; 
                           
                        Get.to(()=>UserBalance(), arguments: [
                           transactionController.deposits!.data![index].transactionCost.toString(), 
                           transactionController.deposits!.data![index].paiementScreenShot.toString(),
                            transactionController.deposits!.data![index].userId.toString(), 
                            transactionController.deposits!.data![index].sId.toString(), 
                            transactionController.deposits!.data![index].userUniqueCode.toString(),
                         
                        ]) ; 
                        print(  transactionController.deposits!.data![index].transactionCost.toString(), ); 
                        
                          },
                        child: Container(
                      
                          child: ListTile(
                            
                                 leading: Icon(
  Icons.wallet_sharp, // Choose the appropriate deposit icon
  size: 50, // Adjust the size to your desired size
  color: Colors.green,
),

                            title: Text(transactionController.deposits!.data![index].transactionType.toString(), style: TextStyle(color: Colors.white),),
                            subtitle: Text(transactionController.deposits!.data![index].status.toString(), style : TextStyle(color: Colors.white)),
                            trailing: Text("${transactionController.deposits!.data![index].transactionCost.toString()}\$", style : TextStyle(color: Colors.white, fontSize: 25)),
                          ),
                        ),
                      ),
                    ),
                );
                          },
                        ),
                      ),
              ),
            ],
          ), 

          Column(
            children: [
          Text("getting treated Deposits", style: TextStyle(color: Colors.white , fontSize: 20, fontWeight: FontWeight.w500),),

              //
              Container(
                 width: 500,
                height: 600,
                child: Obx(
                        ()=> transactionController.isDataLoadedTreatedDeposit.value ? Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
                          itemCount: transactionController.gettingTreatedDeposits?.data?.length ?? 0,
                          itemBuilder: (context, index) {
                return transactionController.gettingTreatedDeposits!.data!.length == 0 ? Center(child: Text("No Deposites",style : TextStyle(color: Colors.white, fontSize: 50),),):  Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 20,
                    color: Color(0xff15202B),
                      child: InkWell(
                         hoverColor: Color(0xff15202B).withOpacity(0.9),
                       onTap: () async {
  Get.to(() => UserBalance(), arguments: [
    transactionController.gettingTreatedDeposits!.data![index].transactionCost.toString(),
    transactionController.gettingTreatedDeposits!.data![index].paiementScreenShot.toString(),
    transactionController.gettingTreatedDeposits!.data![index].userId.toString(),
    transactionController.gettingTreatedDeposits!.data![index].sId.toString(),
    transactionController.gettingTreatedDeposits!.data![index].userUniqueCode.toString(),
   
  ]);
  print(transactionController.gettingTreatedDeposits!.data![index].transactionCost.toString());
},

                        child: Container(
                      
                          child: ListTile(
                            
                                   leading: Icon(
  Icons.wallet_sharp, // Choose the appropriate deposit icon
  size: 50, // Adjust the size to your desired size
  color: Colors.green,
),
                            title: Text(transactionController.gettingTreatedDeposits!.data![index].transactionType.toString(), style: TextStyle(color: Colors.white),),
                            subtitle: Text(transactionController.gettingTreatedDeposits!.data![index].status.toString(), style : TextStyle(color: Colors.white)),
                            trailing: Text("${transactionController.gettingTreatedDeposits!.data![index].transactionCost.toString()}\$", style : TextStyle(color: Colors.white, fontSize: 25)),
                          ),
                        ),
                      ),
                    ),
                );
                          },
                        ),
                      ),
              ),
            ],
          )
        ]),
      )
      
    
      
    ); 
  }
}