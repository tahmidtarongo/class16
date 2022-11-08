import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_academy/Constant%20Data/server_config.dart';
import 'package:travel_academy/model/sign_up_model.dart';

class AuthRepo{

  Future<bool> signUpWIthEmail(String fullName, String emailAddress, String phoneNumber, String passWord) async{
    String url = Config.serverUrl + Config.signUpUrl;
    var response = await http.post(Uri.parse(url),body: <String, String>{
      'name': fullName,
      'email': emailAddress,
      'phone': phoneNumber,
      'password': passWord
    });
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      var decodedData = SignUpModel.fromJson(data);
      print(decodedData.data!.token);
      return true;
    } else{
      return false;
    }
  }

}