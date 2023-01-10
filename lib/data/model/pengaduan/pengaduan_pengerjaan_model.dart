import 'package:freezed_annotation/freezed_annotation.dart';

part 'pengaduan_pengerjaan_model.freezed.dart';
part 'pengaduan_pengerjaan_model.g.dart';

@freezed
class PengaduanPengerjaanModel with _$PengaduanPengerjaanModel {
  factory PengaduanPengerjaanModel(
      {required int id,
      @JsonKey(name: 'id_pengaduan')
          required int idPengaduan,
      required String status,
      @JsonKey(name: 'durasi_pengerjaan')
          required String durasiPengerjaan}) = _PengaduanPengerjaanModel;

  factory PengaduanPengerjaanModel.fromJson(Map<String, dynamic> data) =>
      _$PengaduanPengerjaanModelFromJson(data);
}
