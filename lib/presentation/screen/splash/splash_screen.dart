import 'package:flutter/material.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String name = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then(
        (value) => NavigationService().router.replace(const LoginRoute()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Skripshit by wied'),
      ),
    );
  }
}
