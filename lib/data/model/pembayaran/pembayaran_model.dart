import 'package:freezed_annotation/freezed_annotation.dart';

part 'pembayaran_model.freezed.dart';
part 'pembayaran_model.g.dart';

@freezed
class PembayaranModel with _$PembayaranModel {
  factory PembayaranModel({
    required int id,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_pemilik') required int idPemilik,
    @JsonKey(name: 'id_kost') required int idKost,
    @JsonKey(name: 'id_kost_stok') required int idKostJenis,
    @JsonKey(name: 'jumlah_bayar') required int jumlahBayar,
    @JsonKey(name: 'tanggal_bayar') required String tanggalBayar,
    @JsonKey(name: 'bukti_bayar') required String buktiBayar,
    required String status,
    @JsonKey(name: 'namaRekening') required String namaRekening,
    @JsonKey(name: 'nama_bank') required String namaBank,
    @JsonKey(name: 'to_id_bank') required int toIdBank,
    @JsonKey(name: 'komentar') String? komentar,
  }) = _PembayaranModel;

  factory PembayaranModel.fromJson(Map<String, dynamic> data) =>
      _$PembayaranModelFromJson(data);
}
