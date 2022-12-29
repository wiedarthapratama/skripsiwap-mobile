import 'package:freezed_annotation/freezed_annotation.dart';

part 'kos_foto_model.freezed.dart';
part 'kos_foto_model.g.dart';

@freezed
class KosFotoModel with _$KosFotoModel {
  factory KosFotoModel(
      {required int id,
      @JsonKey(name: 'id_kost_jenis') required int idKosJenis,
      @JsonKey(name: 'main_foto') required int mainFoto,
      required String foto}) = _KosFotoModel;

  factory KosFotoModel.fromJson(Map<String, dynamic> data) =>
      _$KosFotoModelFromJson(data);
}
