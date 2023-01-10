import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skripsi_wap/common/extension/extension.dart';
import 'package:skripsi_wap/common/style/style.dart';
import 'package:skripsi_wap/presentation/viewmodel/user/user_viewmodel.dart';
import 'package:skripsi_wap/presentation/widget/appbar/appbar.dart';
import 'package:skripsi_wap/presentation/widget/button/button.dart';
import 'package:skripsi_wap/presentation/widget/spacing/spacing.dart';
import 'package:skripsi_wap/presentation/widget/textfield/textfield.dart';
import 'package:skripsi_wap/util/validator/validator.dart';

class UbahProfileScreen extends StatefulWidget {
  const UbahProfileScreen({Key? key}) : super(key: key);

  static const String name = 'UbahProfileScreen';

  @override
  State<UbahProfileScreen> createState() => _UbahProfileScreenState();
}

class _UbahProfileScreenState extends State<UbahProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WPrimaryAppBar(
        title: 'Aplikasi',
        elevation: .2,
      ),
      body: ChangeNotifierProvider<UserViewModel>(
        create: (_) => UserViewModel()..init(),
        child: Consumer<UserViewModel>(builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: viewModel.formKey,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'UbahProfile Kos',
                    style: WTextStyle.headline3.bold,
                  ),
                  WSpacing.vertical.size16,
                  WPrimaryTextField(
                    label: 'Nama',
                    controller: viewModel.namaController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Judul masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size16,
                  WPrimaryTextField(
                    label: 'Email',
                    controller: viewModel.emailController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Judul masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size16,
                  WPrimaryTextField(
                    label: 'Telepon',
                    controller: viewModel.teleponController,
                    validator: (value) => (value ?? '').isEmpty
                        ? 'Judul masih kosong'
                        : value!.hasEmoji
                            ? 'Tidak boleh mengandung emoji'
                            : null,
                  ),
                  WSpacing.vertical.size8,
                  // WPrimaryTextField(
                  //   label: 'Foto Pribadi',
                  //   enable: false,
                  //   onTap: () async {
                  //     var image = await ImagePicker()
                  //         .pickImage(source: ImageSource.camera, imageQuality: 75);

                  //     if (image != null) {
                  //       File? file =
                  //           await FlutterExifRotation.rotateImage(path: image.path);

                  //       log('berhasil: $file');
                  //     }
                  //   },
                  // ),
                  // WSpacing.vertical.size8,
                  Center(
                    child: WPrimaryButton(
                      title: 'Kirim',
                      onTap: viewModel.onSave,
                      fullWidth: false,
                      isLoading: viewModel.isLoadingCTA,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
