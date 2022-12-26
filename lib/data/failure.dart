import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:skripsi_wap/presentation/widget/modal/modal.dart';

part 'failure.g.dart';

abstract class Failure {
  final String message;
  final int code;
  const Failure(this.message, this.code);

  void showAlert(BuildContext? context) {
    WModal.show(context,
        isScrollControlled: true,
        title: 'Gagal',
        message: message,
        alignment: CrossAxisAlignment.center);
  }
}

@JsonSerializable()
class BaseFailure extends Failure {
  const BaseFailure(String message, int code) : super(message, code);

  factory BaseFailure.fromJson(Map<String, dynamic> data) =>
      _$BaseFailureFromJson(data);

  Map<String, dynamic> toJson() => _$BaseFailureToJson(this);
}
