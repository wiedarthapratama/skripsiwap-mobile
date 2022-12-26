part of 'enum.dart';

enum StorageKeyEnum { accessToken, secretBox }

extension StorageKeyEnumExt on StorageKeyEnum {
  String get name {
    switch (this) {
      case StorageKeyEnum.accessToken:
        return 'access_token';
      case StorageKeyEnum.secretBox:
        return 'secret_box';
    }
  }
}
