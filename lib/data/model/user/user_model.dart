import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {required int id,
      required String email,
      required String nohp,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'created_at') required String createdAat,
      @JsonKey(name: 'updated_at') required String updatedAt}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);
}
