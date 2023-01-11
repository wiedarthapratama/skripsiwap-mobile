import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/pembayaran/pembayaran_model.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'kos_saya_model.freezed.dart';
part 'kos_saya_model.g.dart';

@freezed
class KosSayaModel with _$KosSayaModel {
  factory KosSayaModel({
    required int id,
    @JsonKey(name: 'id_kost_jenis') required int idKosJenis,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'tanggal_masuk') required String tanggalMasuk,
    String? status,
    @JsonKey(name: 'nomor_kost') required String nomorKos,
    @JsonKey(name: 'id_pendaftaran') required int idPendaftaran,
    @JsonKey(name: 'list_pembayaran')
        required List<PembayaranModel> dataPembayaran,
    @JsonKey(name: 'list_pengaduan')
        required List<PengaduanModel> dataPengaduan,
    required UserModel user,
    @JsonKey(name: 'kost_tipe') required KosTipeModel kosTipe,
  }) = _KosSayaModel;

  factory KosSayaModel.fromJson(Map<String, dynamic> data) =>
      _$KosSayaModelFromJson(data);
}
