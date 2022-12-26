import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class PengaduanDetailScreen extends StatefulWidget {
  const PengaduanDetailScreen({Key? key}) : super(key: key);

  static const String name = 'PengaduanDetailScreen';

  @override
  State<PengaduanDetailScreen> createState() => _PengaduanDetailScreenState();
}

class _PengaduanDetailScreenState extends State<PengaduanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Pengaduan',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Judul',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    'Ini Judul Pengaduan',
                    style: WTextStyle.body2.bold,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            WSpacing.vertical.size8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deskripsi',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    'Ini Deskripsi Pengaduan',
                    style: WTextStyle.body2.bold,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            WSpacing.vertical.size8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status Pengaduan',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    'Menunggu Konfirmasi',
                    style: WTextStyle.body2.bold,
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            WSpacing.vertical.size8,
            Text(
              'Bukti Pelengkap',
              style: WTextStyle.body2,
            ),
            WSpacing.vertical.size6,
            const WCacheImage(
              url:
                  'https://pps.unj.ac.id/wp-content/uploads/2021/09/placeholder-1.png',
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
