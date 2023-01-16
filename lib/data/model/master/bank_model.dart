import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel {
  factory BankModel(
      {required int id,
      @JsonKey(name: 'nama_bank') required String namaBank,
      @JsonKey(name: 'nama_rekening') required String namaRekening,
      @JsonKey(name: 'nomor_rekening') required String nomorRekening,
      @JsonKey(name: 'id_pemilik') required int idPemilik}) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> data) =>
      _$BankModelFromJson(data);
}
