import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:travel_academy/repository/auth_repo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthRepo _authRepo = AuthRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            AppTextField(
              textFieldType: TextFieldType.NAME,
              controller: fullNameController,
              decoration: InputDecoration(hintText: 'Enter Your Full Name', border: OutlineInputBorder(), fillColor: Colors.white, filled: true),
            ),
            SizedBox(height: 10.0,),
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              controller: emailAddressController,
              decoration: const InputDecoration(hintText: 'Enter Your Email Address', border: OutlineInputBorder(), fillColor: Colors.white, filled: true),
            ),
            SizedBox(height: 10.0,),

            AppTextField(
              textFieldType: TextFieldType.PHONE,
              controller: phoneNumberController,
              decoration: const InputDecoration(hintText: 'Enter Your Phone Number', border: OutlineInputBorder(), fillColor: Colors.white, filled: true),
            ),
            SizedBox(height: 10.0,),

            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Enter Your Password', border: OutlineInputBorder(), fillColor: Colors.white, filled: true),
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(onPressed: () async{
              if(emailAddressController.text.isEmpty){
                toast('Please Enter Your Email Address');
              } else if(fullNameController.text.isEmpty){
                toast('Please Enter Your Name');
              }
              else if(phoneNumberController.text.isEmpty){
                toast('Please Enter Your phone Number');
              }
              else if(passwordController.text.isEmpty){
                toast('Please Enter Your Password');
              } else if(passwordController.text.length < 6){
                toast('Password should be at least 6 digit');
              } else{
                try{
                  EasyLoading.show(status: 'Signing Up...');
                  bool status = await _authRepo.signUpWIthEmail(fullNameController.text, emailAddressController.text, phoneNumberController.text, passwordController.text);
                  if(status){
                    EasyLoading.showSuccess('Sign Up Successful');
                  } else{
                    EasyLoading.showError('Something Went Wrong, Try Again');
                  }
                }catch(e){
                  EasyLoading.showError(e.toString());
                }
              }
            }, child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign Up',style: TextStyle(fontSize: 18.0),),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
