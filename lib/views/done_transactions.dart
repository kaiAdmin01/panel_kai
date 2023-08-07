import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai_admin_panel/controllers/transaction_controller.dart';
import 'package:kai_admin_panel/views/user_balance.dart';


class DoneTransactions extends StatefulWidget {
  DoneTransactions({Key? key}) : super(key: key);

  @override
  State<DoneTransactions> createState() => _DoneTransactionsState();
}

class _DoneTransactionsState extends State<DoneTransactions> {

  TransactionController transactionController = Get.put(TransactionController()); 

  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('done transactions', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff15202B),
      body: Center(
        child: Obx(
          ()=> transactionController.isDataLoadedAll.value ? Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
            itemCount: transactionController.DoneTransactions?.data?.length ?? 0,
            itemBuilder: (context, index) {
              return transactionController.DoneTransactions?.data?.length == 0  ? Center(child: Text("no recent done transactions", style: TextStyle(color: Colors.white),),) : Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 20,
                  color: Color(0xff15202B),
                    child: InkWell(
                       hoverColor: Color(0xff15202B).withOpacity(0.9),
                     
                      child: Container(
                    
                        child: ListTile(
                                                
                                                leading: CircleAvatar(
                        radius: 50, // Adjust the radius to your desired size
                        child: ClipOval(
                          child: Icon(Icons.person, color: Colors.white,)
                        ),
                      ),
                          title: Text(transactionController.DoneTransactions!.data![index].transactionCost.toString(), style: TextStyle(color: Colors.white),),
                          subtitle: Text(transactionController.DoneTransactions!.data![index].createdAt.toString(), style : TextStyle(color: Colors.white)),
                          trailing: Text(transactionController.DoneTransactions!.data![index].userUniqueCode.toString(), style : TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
              );
            },
          ),
        ),
      ),
    
      
    ); 
  }
}



class DoneWithdrawl extends StatefulWidget {
  DoneWithdrawl({Key? key}) : super(key: key);

  @override
  State<DoneWithdrawl> createState() => _DoneWithdrawlState();
}

class _DoneWithdrawlState extends State<DoneWithdrawl> {

  TransactionController transactionController = Get.put(TransactionController()); 

  @override
  void initState() {
    // TODO: implement initState
    transactionController.fetchDoneWithdrawl(); 
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        leading: IconButton( color: Colors.white, onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back,),),
         backgroundColor: Color(0xff15202B),
        title: Text('done transactions', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff15202B),
      body: Center(
        child: Obx(
          ()=> transactionController.isDataLoadedDoneWithdrawl.value ? Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
            itemCount: transactionController.DoneWithdrawl?.data?.length ?? 0,
            itemBuilder: (context, index) {
              return transactionController.DoneWithdrawl?.data?.length == 0  ? Center(child: Text("no recent done transactions", style: TextStyle(color: Colors.white),),) : Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 20,
                  color: Color(0xff15202B),
                    child: InkWell(
                       hoverColor: Color(0xff15202B).withOpacity(0.9),
                     
                      child: Container(
                    
                        child: ListTile(
                                                
                                                leading: CircleAvatar(
                        radius: 50, // Adjust the radius to your desired size
                        child: ClipOval(
                          child: Icon(Icons.person, color: Colors.white,)
                        ),
                      ),
                          title: Text(transactionController.DoneWithdrawl!.data![index].transactionCost.toString(), style: TextStyle(color: Colors.white),),
                          subtitle: Text(transactionController.DoneWithdrawl!.data![index].createdAt.toString(), style : TextStyle(color: Colors.white)),
                          trailing: Text(transactionController.DoneWithdrawl!.data![index].userUniqueCode.toString(), style : TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
              );
            },
          ),
        ),
      ),
    
      
    ); 
  }
}