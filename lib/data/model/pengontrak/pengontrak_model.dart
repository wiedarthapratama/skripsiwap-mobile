import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/util/util.dart';

part 'pengontrak_model.freezed.dart';
part 'pengontrak_model.g.dart';

@freezed
class PengontrakModel with _$PengontrakModel {
  const PengontrakModel._();

  factory PengontrakModel(
          {@JsonKey(name: 'id_user') required int idUser,
          @JsonKey(name: 'id_kost_jenis') required int idKosJenis,
          required String name,
          required String judul,
          @JsonKey(name: 'nama_tipe') required String namaTipe,
          @JsonKey(name: 'tanggal_masuk') required String tanggalMasuk}) =
      _PengontrakModel;

  factory PengontrakModel.fromJson(Map<String, dynamic> data) =>
      _$PengontrakModelFromJson(data);

  String get toDateFormat => tanggalMasuk.dateFormat.formatdmY;
}
