import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String name = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home,
                size: 80.w,
              ),
              WSpacing.vertical.size16,
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
              WSpacing.vertical.size16,
              TextField(
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
