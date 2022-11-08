import 'package:flutter/material.dart';
import 'package:travel_academy/Constant%20Data/app_colors.dart';
import 'package:travel_academy/Screens/Authentication/sign_up.dart';
import 'package:travel_academy/Screens/Home%20Screen/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> goToHome() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpScreen())));
  }

  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: CircleAvatar(
          radius: 100.0,
          backgroundColor: Colors.white,
          child: Text(
            'Travel',
            style: TextStyle(color: titleColor, fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
