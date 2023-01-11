import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'pendaftaran_model.freezed.dart';
part 'pendaftaran_model.g.dart';

@freezed
class PendaftaranModel with _$PendaftaranModel {
  factory PendaftaranModel({
    required int id,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_pemilik') required int idPemilik,
    @JsonKey(name: 'id_kost') required int idKos,
    @JsonKey(name: 'id_kost_stok') required int idKosStok,
    @JsonKey(name: 'tanggal_sewa') required String tanggalSewa,
    @JsonKey(name: 'foto_ktp') required String fotoKtp,
    @JsonKey(name: 'foto_pribadi') required String fotoPribadi,
    @JsonKey(name: 'foto_kk') required String fotoKK,
    @JsonKey(name: 'durasi_sewa') String? durasiSewa,
    @JsonKey(name: 'tanggal_mulai') required String tanggalMulai,
    int? jumlahBayar,
    required UserModel user,
    @JsonKey(name: 'kost') required KosModel kos,
    @JsonKey(name: 'kost_tipe') required KosTipeModel kosTipe,
  }) = _PendaftaranModel;

  factory PendaftaranModel.fromJson(Map<String, dynamic> data) =>
      _$PendaftaranModelFromJson(data);
}
