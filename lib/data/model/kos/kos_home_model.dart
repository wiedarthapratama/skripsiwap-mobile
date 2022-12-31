import 'package:freezed_annotation/freezed_annotation.dart';

part 'kos_home_model.freezed.dart';
part 'kos_home_model.g.dart';

@freezed
class KosHomeModel with _$KosHomeModel {
  factory KosHomeModel(
      {@JsonKey(name: 'id_kost') required int idKost,
      @JsonKey(name: 'id_kost_tipe') required int idKostTipe,
      @JsonKey(name: 'nama') required String nama,
      @JsonKey(name: 'harga_per_bulan') required int hargaPerBulan,
      @Default('') String alamat,
      required String foto}) = _KosHomeModel;

  factory KosHomeModel.fromJson(Map<String, dynamic> data) =>
      _$KosHomeModelFromJson(data);
}
