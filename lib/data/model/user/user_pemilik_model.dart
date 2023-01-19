import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'user_pemilik_model.freezed.dart';
part 'user_pemilik_model.g.dart';

@freezed
class UserPemilikModel with _$UserPemilikModel {
  factory UserPemilikModel({
    required int id,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_provinsi') required int idProvinsi,
    @JsonKey(name: 'id_kabupaten') required int idKabupaten,
    @JsonKey(name: 'id_kecamatan') required int idKecamatan,
    @JsonKey(name: 'id_desa') required int idDesa,
    @JsonKey(name: 'user') UserModel? user,
    required String alamat,
  }) = _UserPemilikModel;

  factory UserPemilikModel.fromJson(Map<String, dynamic> data) =>
      _$UserPemilikModelFromJson(data);
}
