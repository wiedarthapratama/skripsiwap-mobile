part 'email_validator.dart';
part 'password_validator.dart';

extension StrValidator on String {
  bool get hasEmoji {
    final RegExp emojis = RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');

    return contains(emojis);
  }
}
