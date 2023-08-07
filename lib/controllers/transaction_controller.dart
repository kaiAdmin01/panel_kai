


import 'dart:convert';


import 'package:get/get.dart';
import 'package:kai_admin_panel/models/transaction_model.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
class TransactionController extends GetxController{
  DataUser? depositUser ;  
  DataUser? withdrawalUser ; 
  Transactions? deposits ; 
  Transactions? withdrawls ; 
  Transactions? DoneTransactions ; 
  RxBool isDataLoaded = false.obs ;
  RxBool isDataLoadedWithdrawl = false.obs ;
  RxBool isDataLoadedAll = false.obs ;
  Transactions? gettingTreatedWithdrawals ; 
  Transactions? gettingTreatedDeposits ; 
  RxBool depositLoad = false.obs ; 
 RxBool userLoadForDeposit = false.obs ;
 RxBool userLoadForWithdrawal = false.obs ; 
 RxBool isDataLoadedTreatedWithdrawl = false.obs ; 
 RxBool isDataLoadedTreatedDeposit = false.obs ; 
 RxBool isDataLoadedDoneWithdrawl = false.obs ; 
 Transactions? DoneWithdrawl ; 

 

  @override
    void onInit(){
      fetchDepositTransactions();
      fetchWithdrawlTransactions(); 
      fetchDoneTransactions() ; 
      super.onInit();
      
    }


     fetchDoneTransactions() async {
    try{
      isDataLoadedAll(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/transactions?status=done&transactionType=deposit'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      DoneTransactions = Transactions.fromJson(jsonData);
     
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
    isDataLoadedAll(false); 
    }
    
  }
   fetchDoneWithdrawl() async {
    try{
      isDataLoadedDoneWithdrawl(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/transactions?status=done&transactionType=Withdrawl'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      DoneWithdrawl = Transactions.fromJson(jsonData);
     
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
    isDataLoadedDoneWithdrawl(false); 
    }
    
  }

  fetchDepositTransactions() async {
    try{
      isDataLoaded(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/transactions?status=pending&transactionType=deposit'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      deposits = Transactions.fromJson(jsonData);
     
    
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
  //
  fetchTreatedDepositTransactions() async {
    try{
      isDataLoadedTreatedDeposit(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/transactions?status=isGettingTreated&transactionType=deposit'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      gettingTreatedDeposits = Transactions.fromJson(jsonData);
     
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
   isDataLoadedTreatedDeposit(false); 
    }
    
  } 
  //
  fetchTreatedWithdrawlTransactions() async {
    try{
      isDataLoadedTreatedWithdrawl(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/transactions?status=isGettingTreated&transactionType=Withdrawl'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      gettingTreatedWithdrawals = Transactions.fromJson(jsonData);
     
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
   isDataLoadedTreatedWithdrawl(false); 
    }
    
  } 
  //
  fetchWithdrawlTransactions() async {
    try{
      isDataLoadedWithdrawl(true); 
    final response = await http.get(Uri.parse('http://162.19.79.228/api/admin/transactions?status=pending&transactionType=Withdrawl'),
    headers: {
           'content-type' : 'application/json',
         }
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) ;
      withdrawls = Transactions.fromJson(jsonData);
     
    
    } 

    }catch(err
    ){
      print("lena lmochkla");
      print(err);
    }
    finally{
    isDataLoadedWithdrawl(false); 
    }
    
  }

  Future<void> updateUserPoints(String userId, double  pointsToAdd, double userPoints ) async {
  try{

    depositLoad.value = true ; 
    double totalPoints = pointsToAdd + userPoints ; 

    final url = "http://162.19.79.228/api/admin/user/${userId}"; // Replace with your API endpoint

  final response = await http.put(
    Uri.parse(url),
    headers: {
           'content-type' : 'application/json',
         },
    body: jsonEncode({
        "points": totalPoints.toString(),
      }),
  );

  if (response.statusCode == 200) {
    print('User points updated successfully');
  } else {
    print('Failed to update user points. Status code: ${response.statusCode}');
  }


  }catch(err){
 
    print(err);
  }finally{
    depositLoad.value = false ; 
  }
}
 


  getUserByIdForWithdrawl(String userId) async {
  final url = Uri.parse('http://162.19.79.228/api/admin/user/${userId}');

  try {
    userLoadForWithdrawal.value = true ; 
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final userData = jsonBody;

      if (userData != null) {
        print(userData); 
        withdrawalUser =  DataUser.fromJson(userData);
      }
    }
  } catch (e) {
    print('Error retrieving user data: $e');
  }finally{
    userLoadForWithdrawal.value =false  ;
  }


}

 getUserByIdForDeposit(String userId) async {
  final url = Uri.parse('http://162.19.79.228/api/admin/user/${userId}');

  try {
    userLoadForDeposit.value = true ; 
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final userData = jsonBody;

      if (userData != null) {
        print(userData); 
        depositUser =  DataUser.fromJson(userData);
      }
    }
  } catch (e) {
    print('Error retrieving user data: $e');
  }finally{
    userLoadForDeposit.value =false  ;
  }


}

// update transaction status 
Future<void> updateTransactionStatus( String transactionId , String status ) async {
  try{
   
    final url = 'http://162.19.79.228/api/admin/transaction/${transactionId}'; // Replace with your API endpoint

  final Map<String, dynamic> requestData = {

    "status": status,
  };

  final jsonBody = json.encode(requestData);

  final response = await http.put(
    Uri.parse(url),
    headers: {
           'content-type' : 'application/json',
         },
    body: jsonBody,
  );

  if (response.statusCode == 200) {
    print('transaction status updated successfully');
  } else {
    print('Failed to update transaction status. Status code: ${response.statusCode}');
  }


  }catch(err){
    print(err);
  }finally{
   
  }
}

}