part of 'util.dart';

void debugLog(
  String message, {
  Level type = Level.debug,
  Object? error,
  StackTrace? stackTrace,
  bool usePrettier = true,
}) {
  if (Env.appDebug) {
    if (usePrettier) {
      Logger(
              printer: PrefixPrinter(PrettyPrinter(printTime: true)),
              output: WConsoleOutput())
          .log(type, message, error, stackTrace);
    } else {
      log(message, error: error, stackTrace: stackTrace);
    }
  }
}

void hideKeyboard(BuildContext? context) {
  if (context == null) return;
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

showError(
    {String message = 'Sedang terjadi kesalahan', bool cancelable = true}) {
  if (NavigationService().currentContext == null) {
    return;
  }

  ScaffoldMessenger.of(NavigationService().currentContext!)
      .removeCurrentSnackBar();
  ScaffoldMessenger.of(NavigationService().currentContext!)
      .showSnackBar(WSnackBar(
    title: message,
    type: WSnackBarType.error,
    cancelable: cancelable,
  ));
}

showSuccess({required String message, bool cancelable = true}) {
  if (NavigationService().currentContext == null) {
    return;
  }

  ScaffoldMessenger.of(NavigationService().currentContext!)
      .removeCurrentSnackBar();
  ScaffoldMessenger.of(NavigationService().currentContext!)
      .showSnackBar(WSnackBar(
    title: message,
    type: WSnackBarType.success,
    cancelable: cancelable,
  ));
}

showDefault({required String message, bool cancelable = true}) {
  if (NavigationService().currentContext == null) {
    return;
  }

  ScaffoldMessenger.of(NavigationService().currentContext!)
      .removeCurrentSnackBar();
  ScaffoldMessenger.of(NavigationService().currentContext!)
      .showSnackBar(WSnackBar(
    title: message,
    type: WSnackBarType.defaultSnackbar,
    cancelable: cancelable,
  ));
}

class WConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(log);
  }
}
