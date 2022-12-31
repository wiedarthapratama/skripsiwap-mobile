import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class CityModel with _$CityModel {
  factory CityModel(
          {required int id,
          @JsonKey(name: 'id_provinsi') required int idProvinsi,
          @JsonKey(name: 'nama_kabupaten') required String namaKabupaten}) =
      _CityModel;

  factory CityModel.fromJson(Map<String, dynamic> data) =>
      _$CityModelFromJson(data);
}
