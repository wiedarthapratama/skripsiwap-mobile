import 'package:freezed_annotation/freezed_annotation.dart';

part 'village_model.freezed.dart';
part 'village_model.g.dart';

@freezed
class VillageModel with _$VillageModel {
  factory VillageModel(
      {required int id,
      @JsonKey(name: 'id_kecamatan') required int idKecamatan,
      @JsonKey(name: 'nama_desa') required String namaDesa}) = _VillageModel;

  factory VillageModel.fromJson(Map<String, dynamic> data) =>
      _$VillageModelFromJson(data);
}
