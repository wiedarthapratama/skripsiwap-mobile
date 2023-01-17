import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifikasi_model.freezed.dart';
part 'notifikasi_model.g.dart';

@freezed
class NotifikasiModel with _$NotifikasiModel {
  factory NotifikasiModel({
    required int id,
    @JsonKey(name: 'id_user') required int idUser,
    required String judul,
    required String deskripsi,
    required String tgl,
    @JsonKey(name: 'is_read') required int isRead,
  }) = _NotifikasiModel;

  factory NotifikasiModel.fromJson(Map<String, dynamic> data) =>
      _$NotifikasiModelFromJson(data);
}
