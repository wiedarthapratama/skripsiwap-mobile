import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_wap/common/enum/enum.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';

class ServerException implements Exception {}

class WException extends DioError {
  final DioError dioError;
  WException(this.dioError)
      : super(
          requestOptions: dioError.requestOptions,
          error: dioError.error,
          response: dioError.response,
          type: dioError.type,
        );

  WErrorType get errorType {
    var t = WErrorType.DEFAULT;
    var statusCode = response?.statusCode ?? 500;
    (response?.statusCode ?? 400) == 503
        ? WErrorType.MAINTENANCE
        : WErrorType.DEFAULT;

    if (statusCode == 503) {
      t = WErrorType.MAINTENANCE;
    }

    if (statusCode == 401) {
      t = WErrorType.UNAUTHENTICATED;
    }

    return t;
  }

  @override
  String get message => response?.data['message'] ?? 'Terjadi Kesalahan';

  void showAlert(BuildContext? context) {
    WModal.show(context,
        title: 'Gagal',
        message: response?.data['message'].toString() ?? 'Terjadi Kesalahan',
        alignment: CrossAxisAlignment.center);
  }
}
