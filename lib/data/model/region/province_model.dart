import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_model.freezed.dart';
part 'province_model.g.dart';

@freezed
class ProvinceModel with _$ProvinceModel {
  factory ProvinceModel(
          {required int id,
          @JsonKey(name: 'nama_provinsi') required String namaProvinsi}) =
      _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, dynamic> data) =>
      _$ProvinceModelFromJson(data);
}
