import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
class BaseResponse with _$BaseResponse {
  factory BaseResponse(
      {required bool status,
      @Default('') String message,
      dynamic data}) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> data) =>
      _$BaseResponseFromJson(data);
}

extension BaseResponseExt on BaseResponse? {
  bool get isSuccess => this != null && this!.status;
}
