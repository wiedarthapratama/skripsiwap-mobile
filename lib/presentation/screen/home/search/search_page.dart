import 'package:flutter/material.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WColors.white,
      appBar: WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: Icon(
              Icons.notifications,
              size: 28,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          WSpacingDirection.vertical.size16,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.filter_alt_rounded),
                  ),
                ),
                Expanded(
                  child: WPrimaryTextField(
                    hint: 'Pencarian',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
