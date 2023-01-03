import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

@freezed
class WException with _$WException {
  @Implements<Exception>()
  const factory WException.serverException(
      {required String message, @Default(500) int code}) = _WServerException;

  @Implements<Exception>()
  const factory WException.maintenance(
      {required String message, @Default(503) int code}) = _WMaintenance;

  @Implements<Exception>()
  const factory WException.unauthenticated(
      {required String message, @Default(401) int code}) = _WUnauthenticated;

  @Implements<Exception>()
  const factory WException.internalServerException(
      {@Default('Terjadi Kesalahan') String message,
      @Default(500) int code}) = _WInternalServerException;

  @Implements<Exception>()
  const factory WException.badNetworkException(
      {@Default('Koneksi bermasalah, silahkan coba lagi') String message,
      @Default(500) int code}) = _WBadNetworkException;
}
