import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/presentation/viewmodel/notifikasi/notifikasi_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';

class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  static const String name = 'NotifikasiScreen';

  @override
  State<NotifikasiScreen> createState() => _NotifikasiScreenState();
}

class _NotifikasiScreenState extends State<NotifikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Notifikasi',
              style: WTextStyle.headline3.bold,
            ),
            Expanded(
              child: ChangeNotifierProvider<NotifikasiViewModel>(
                  create: (_) => NotifikasiViewModel()..init(),
                  child: Consumer<NotifikasiViewModel>(
                      builder: (_, viewModel, __) => viewModel.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: viewModel.data.length,
                              itemBuilder: (_, position) {
                                var data = viewModel.data[position];
                                return Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: WColors.primary)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            data.judul,
                                            style: WTextStyle.subtitle1.bold,
                                          ),
                                          Text(
                                            data.deskripsi,
                                            style: WTextStyle.subtitle2,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }))),
            ),
          ],
        ),
      ),
    );
  }
}
