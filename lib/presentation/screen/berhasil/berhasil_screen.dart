import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class BerhasilScreen extends StatefulWidget {
  const BerhasilScreen({Key? key}) : super(key: key);

  static const String name = 'BerhasilScreen';

  @override
  State<BerhasilScreen> createState() => _BerhasilScreenState();
}

class _BerhasilScreenState extends State<BerhasilScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check,
              size: 100,
            ),
            Text(
              'Pendaftaran Berhasil',
              style: WTextStyle.headline3.bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Harap menunggu pemilik kost untuk konfirmasi pendaftaranmu',
              style: WTextStyle.subtitle2.bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            WSecondaryButton(
              title: 'Kembali ke Menu Utama',
              onTap: () => NavigationService().router.popUntilRoot(),
              fullWidth: false,
            )
          ],
        ),
      ),
    );
  }
}
