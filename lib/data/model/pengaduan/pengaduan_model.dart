import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_tipe_model.dart';
import 'package:skripsi_wap/data/model/pengaduan/pengaduan_pengerjaan_model.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'pengaduan_model.freezed.dart';
part 'pengaduan_model.g.dart';

@freezed
class PengaduanModel with _$PengaduanModel {
  factory PengaduanModel({
    required int id,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_pemilik') required int idPemilik,
    @JsonKey(name: 'id_kost') required int idKos,
    @JsonKey(name: 'id_kost_stok') required int idKosStok,
    required String judul,
    required String deskripsi,
    required String status,
    required String tanggal,
    @JsonKey(name: 'foto_pengaduan') required String fotoPengaduan,
    UserModel? user,
    KosModel? kos,
    @JsonKey(name: 'kost_tipe') KosTipeModel? kosTipe,
    PengaduanPengerjaanModel? pengerjaan,
  }) = _PengaduanModel;

  factory PengaduanModel.fromJson(Map<String, dynamic> data) =>
      _$PengaduanModelFromJson(data);
}
