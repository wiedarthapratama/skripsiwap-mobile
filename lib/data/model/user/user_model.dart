import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  factory UserModel(
          {required int id,
          required String name,
          required String email,
          required String nohp,
          @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
          @JsonKey(name: 'created_at') required String createdAat,
          @JsonKey(name: 'updated_at') required String updatedAt,
          @JsonKey(name: 'is_pemilik') @Default(false) bool isPemilik}) =
      _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> data) =>
      _$UserModelFromJson(data);

  String get phoneInternational => nohp.replaceFirst('08', '628');
}
