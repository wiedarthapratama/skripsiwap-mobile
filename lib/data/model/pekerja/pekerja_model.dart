import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'pekerja_model.freezed.dart';
part 'pekerja_model.g.dart';

@freezed
class PekerjaModel with _$PekerjaModel {
  factory PekerjaModel({
    required int id,
    required String nama,
    required String nohp,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_provinsi') required int idProvinsi,
    @JsonKey(name: 'id_kabupaten') required int idKabupaten,
    @JsonKey(name: 'id_kecamatan') required int idKecamatan,
    @JsonKey(name: 'id_desa') required int idDesa,
    required String alamat,
    ProvinceModel? provinsi,
    CityModel? kabupaten,
    SubdistrictModel? kecamatan,
    VillageModel? desa,
    required UserModel user,
  }) = _PekerjaModel;

  factory PekerjaModel.fromJson(Map<String, dynamic> data) =>
      _$PekerjaModelFromJson(data);
}
