import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/region/city_model.dart';
import 'package:skripsi_wap/data/model/region/province_model.dart';
import 'package:skripsi_wap/data/model/region/subdistrict_model.dart';
import 'package:skripsi_wap/data/model/region/village_model.dart';

part 'kos_model.freezed.dart';
part 'kos_model.g.dart';

@freezed
class KosModel with _$KosModel {
  factory KosModel(
      {required int id,
      @JsonKey(name: 'id_pemilik')
          required int idPemilik,
      required String judul,
      required String deskripsi,
      @JsonKey(name: 'id_provinsi')
          required int idProvinsi,
      @JsonKey(name: 'id_kabupaten')
          required int idKabupaten,
      @JsonKey(name: 'id_kecamatan')
          required int idKecamatan,
      @JsonKey(name: 'id_desa')
          required int idDesa,
      required String alamat,
      double? lat,
      double? lng,
      @JsonKey(name: 'link_maps')
          String? linkMaps,
      ProvinceModel? provinsi,
      CityModel? kabupaten,
      SubdistrictModel? kecamatan,
      VillageModel? desa,
      @JsonKey(name: 'tipe')
      @Default(<KosTipeModel>[])
          List<KosTipeModel> dataTipe}) = _KosModel;

  factory KosModel.fromJson(Map<String, dynamic> data) =>
      _$KosModelFromJson(data);
}
