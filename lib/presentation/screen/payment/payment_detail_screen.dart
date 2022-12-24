import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/image/image.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({Key? key}) : super(key: key);

  static const String name = 'PaymentDetailScreen';

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
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
              'Detail Pembayaran',
              style: WTextStyle.headline3.bold,
            ),
            WSpacing.vertical.size16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nama',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    'Wied',
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
                  'Dari Bank',
                  style: WTextStyle.body2,
                ),
                WSpacing.horizontal.size8,
                Expanded(
                  child: Text(
                    'Allo Bank',
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
                  'Ke Bank',
                  style: WTextStyle.body2,
                ),
                Expanded(
                  child: Text(
                    'OK Bank',
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
                  'Status Pembayaran',
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
              'Bukti Transfer',
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
