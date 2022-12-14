import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skripsi_wap/data/model/user/user_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  factory AuthModel({
    required UserModel user,
    required AuthTokenModel token,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> data) =>
      _$AuthModelFromJson(data);
}

@freezed
class AuthTokenModel with _$AuthTokenModel {
  factory AuthTokenModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') required String tokenType,
    @JsonKey(name: 'expires_in') required int expiresIn,
  }) = _AuthTokenModel;

  factory AuthTokenModel.fromJson(Map<String, dynamic> data) =>
      _$AuthTokenModelFromJson(data);
}
