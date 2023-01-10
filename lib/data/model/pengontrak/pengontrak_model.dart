import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/pembayaran/pembayaran_model.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'pengontrak_model.freezed.dart';
part 'pengontrak_model.g.dart';

@freezed
class PengontrakModel with _$PengontrakModel {
  factory PengontrakModel({
    required int id,
    @JsonKey(name: 'id_kost_jenis') required int idKostJenis,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'tanggal_masuk') required String tanggalMasuk,
    // "status": null,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "nomor_kost") required String nomorKost,
    @JsonKey(name: 'id_pendaftaran') required int idPendaftaran,
    @JsonKey(name: 'list_pembayaran')
    @Default(<PembayaranModel>[])
        List<PembayaranModel> listPembayaran,
    @JsonKey(name: 'list_pengaduan')
    @Default(<PengaduanModel>[])
        List<PengaduanModel> listPengaduan,
    UserModel? user,
    @JsonKey(name: 'kost_tipe') KosTipeModel? kostTipe,
  }) = _PengontrakModel;

  factory PengontrakModel.fromJson(Map<String, dynamic> data) =>
      _$PengontrakModelFromJson(data);
}
