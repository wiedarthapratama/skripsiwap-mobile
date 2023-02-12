import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/master/bank_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'pembayaran_model.freezed.dart';
part 'pembayaran_model.g.dart';

@freezed
class PembayaranModel with _$PembayaranModel {
  factory PembayaranModel({
    required int id,
    required String judul,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_pemilik') required int idPemilik,
    @JsonKey(name: 'id_kost') required int idKos,
    @JsonKey(name: 'id_kost_stok') required int idKosStok,
    @JsonKey(name: 'jumlah_bayar') required int jumlahBayar,
    @JsonKey(name: 'tanggal_bayar') required String tanggalBayar,
    @JsonKey(name: 'bukti_bayar') required String buktiBayar,
    required String status,
    @JsonKey(name: 'nama_rekening') required String namaRekening,
    @JsonKey(name: 'nama_bank') required String namaBank,
    @JsonKey(name: 'to_id_bank') required int toIdBank,
    required UserModel? user,
    @JsonKey(name: 'kost') KosModel? kos,
    @JsonKey(name: 'kost_tipe') KosTipeModel? kosTipe,
    required BankModel? bank,
  }) = _PembayaranModel;

  factory PembayaranModel.fromJson(Map<String, dynamic> data) =>
      _$PembayaranModelFromJson(data);
}
