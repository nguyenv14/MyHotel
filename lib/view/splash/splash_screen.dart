import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_hotel/configs/extensions.dart';
import 'package:my_hotel/view/splash/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashService _splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashService.checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Lottie.asset(
            "assets/raw/hotel.json",
            width: context.mediaQueryWidth * 0.8,
          ),
        ),
      ),
    );
  }
}
