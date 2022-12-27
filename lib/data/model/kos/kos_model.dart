import 'package:freezed_annotation/freezed_annotation.dart';

part 'kos_model.freezed.dart';
part 'kos_model.g.dart';

@freezed
class KosModel with _$KosModel {
  factory KosModel(
      {@JsonKey(name: 'id_kost') required int idKost,
      @JsonKey(name: 'id_kost_tipe') required int idKostTipe,
      @JsonKey(name: 'nama') required String nama,
      @JsonKey(name: 'harga_per_bulan') required int hargaPerBulan,
      @Default('') String alamat,
      required String foto}) = _KosModel;

  factory KosModel.fromJson(Map<String, dynamic> data) =>
      _$KosModelFromJson(data);
}
