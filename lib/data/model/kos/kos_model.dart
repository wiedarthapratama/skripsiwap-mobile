import 'package:freezed_annotation/freezed_annotation.dart';

part 'kos_model.freezed.dart';
part 'kos_model.g.dart';

@freezed
class KosModel with _$KosModel {
  factory KosModel(
      {required int id,
      required String title,
      @Default('') String desc,
      required int price}) = _KosModel;

  factory KosModel.fromJson(Map<String, dynamic> data) =>
      _$KosModelFromJson(data);
}
