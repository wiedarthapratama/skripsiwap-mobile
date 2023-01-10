import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/kos/kos_foto_model.dart';
import 'package:skripsi_wap/data/model/kos/kos_model.dart';

part 'kos_tipe_model.freezed.dart';
part 'kos_tipe_model.g.dart';

@freezed
class KosTipeModel with _$KosTipeModel {
  factory KosTipeModel({
    required int id,
    @JsonKey(name: 'id_kost') required int idKos,
    @JsonKey(name: 'jumlah_kontrakan') required int jumlahKontrakan,
    @JsonKey(name: 'harga_per_bulan') required int hargaPerBulan,
    @JsonKey(name: 'jumlah_ruang') required int jumlahRuang,
    @JsonKey(name: 'is_perabot') required int isPerabot,
    @JsonKey(name: 'is_rumah') required int isRumah,
    @JsonKey(name: 'is_kamar_mandi_dalam') required int isKamarMandiDalem,
    @JsonKey(name: 'is_listrik') required int isListrik,
    required String luas,
    @JsonKey(name: 'nama_tipe') @Default('') String namaTipe,
    @JsonKey(name: 'kost') KosModel? kos,
    @JsonKey(name: 'foto') @Default(<KosFotoModel>[]) List<KosFotoModel> fotos,
  }) = _KosTipeModel;

  factory KosTipeModel.fromJson(Map<String, dynamic> data) =>
      _$KosTipeModelFromJson(data);
}
