import 'package:flutter/material.dart';

class MyFlatPage extends StatefulWidget {
  const MyFlatPage({Key? key}) : super(key: key);

  @override
  State<MyFlatPage> createState() => _MyFlatPageState();
}

class _MyFlatPageState extends State<MyFlatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('kos saya'),
    );
  }
}
