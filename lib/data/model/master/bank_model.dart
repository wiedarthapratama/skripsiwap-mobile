import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_model.freezed.dart';
part 'bank_model.g.dart';

@freezed
class BankModel with _$BankModel {
  factory BankModel(
      {required int id,
      required String namaBank,
      required String nomorRekening,
      required int idPemilik}) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> data) =>
      _$BankModelFromJson(data);
}
