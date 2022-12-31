import 'package:freezed_annotation/freezed_annotation.dart';

part 'subdistrict_model.freezed.dart';
part 'subdistrict_model.g.dart';

@freezed
class SubdistrictModel with _$SubdistrictModel {
  factory SubdistrictModel(
          {required int id,
          @JsonKey(name: 'id_kabupaten') required int idKabupaten,
          @JsonKey(name: 'nama_kecamatan') required String namaKecamatan}) =
      _SubdistrictModel;

  factory SubdistrictModel.fromJson(Map<String, dynamic> data) =>
      _$SubdistrictModelFromJson(data);
}
