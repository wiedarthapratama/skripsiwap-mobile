import 'package:freezed_annotation/freezed_annotation.dart';

part 'pengaduan_model.freezed.dart';
part 'pengaduan_model.g.dart';

@freezed
class PengaduanModel with _$PengaduanModel {
  factory PengaduanModel(
          {required int id,
          @JsonKey(name: 'id_user') required int idUser,
          @JsonKey(name: 'id_pemilik') required int idPemilik,
          @JsonKey(name: 'id_kost') required int idKost,
          required String judul,
          required String deskripsi,
          required String status,
          required String tanggal,
          @JsonKey(name: 'foto_pengaduan') required String fotoPengaduan}) =
      _PengaduanModel;

  factory PengaduanModel.fromJson(Map<String, dynamic> data) =>
      _$PengaduanModelFromJson(data);
}
