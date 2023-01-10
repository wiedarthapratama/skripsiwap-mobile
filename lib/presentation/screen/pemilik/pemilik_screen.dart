import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skripsi_wap/common/decoration/decoration.dart';
import 'package:skripsi_wap/config/colors.gen.dart';
import 'package:skripsi_wap/config/route.gr.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/service/navigation_service.dart';

class PemilikScreen extends StatefulWidget {
  const PemilikScreen({Key? key}) : super(key: key);

  static const String name = 'PemilikScreen';

  @override
  State<PemilikScreen> createState() => _PemilikScreenState();
}

class _PemilikScreenState extends State<PemilikScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 12,
            children: [
              InkWell(
                onTap: () => NavigationService().router.push(const KosRoute()),
                borderRadius: WRadius.size12,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: WColors.primary),
                      borderRadius: WRadius.size12),
                  child: const Text(
                    'Data Kost',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    NavigationService().router.push(const PekerjaRoute()),
                borderRadius: WRadius.size12,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: WColors.primary),
                      borderRadius: WRadius.size12),
                  child: const Text(
                    'Data Pekerja',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    NavigationService().router.push(const PengontrakRoute()),
                borderRadius: WRadius.size12,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: WColors.primary),
                      borderRadius: WRadius.size12),
                  child: const Text(
                    'Data Pengontrak',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () =>
                    NavigationService().router.push(const PengaduanRoute()),
                borderRadius: WRadius.size12,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: WColors.primary),
                      borderRadius: WRadius.size12),
                  child: const Text(
                    'Data Pengaduan',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: WRadius.size12,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: WColors.primary),
                      borderRadius: WRadius.size12),
                  child: const Text(
                    'Data Pembayaran',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                borderRadius: WRadius.size12,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  width: 1.sw,
                  decoration: BoxDecoration(
                      border: Border.all(color: WColors.primary),
                      borderRadius: WRadius.size12),
                  child: const Text(
                    'Calon Pengontrak',
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
