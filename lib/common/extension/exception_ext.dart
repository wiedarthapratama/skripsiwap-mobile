part of 'extension.dart';

extension WExceptionExt on WException {
  WErrorType get errorType {
    var t = WErrorType.DEFAULT;

    if (code == 503) {
      t = WErrorType.MAINTENANCE;
    }

    if (code == 401) {
      t = WErrorType.UNAUTHENTICATED;
    }

    return t;
  }

  void showAlert({List<WErrorType> excepts = const []}) async {
    if (errorType == WErrorType.MAINTENANCE &&
        !excepts.contains(WErrorType.MAINTENANCE)) {
      WModal.show(
        NavigationService().currentContext,
        title: 'Hai Pengguna Game Consign',
        message:
            'Maaf saat ini Game Consign sedang ada maintenance. Mohon Tunggu ya',
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        name: 'maintenance-mode',
        alignment: CrossAxisAlignment.center,
        image: WAssets.image.noInternet.image(
          width: MediaQuery.of(NavigationService().currentContext!).size.width *
              200 /
              360,
          fit: BoxFit.fitWidth,
        ),
      );
      return;
    }

    if (errorType == WErrorType.UNAUTHENTICATED &&
        !excepts.contains(WErrorType.UNAUTHENTICATED)) {
      WModal.show(NavigationService().currentContext,
          title: 'Hai Pengguna Game Consign',
          message: message,
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          alignment: CrossAxisAlignment.center,
          image: WAssets.image.noInternet.image(
            width:
                MediaQuery.of(NavigationService().currentContext!).size.width *
                    200 /
                    360,
            fit: BoxFit.fitWidth,
          ));
      return;
    }

    if (!excepts.contains(WErrorType.DEFAULT)) {
      WModal.show(NavigationService().currentContext,
          isScrollControlled: true,
          title: 'Gagal',
          message: message,
          alignment: CrossAxisAlignment.center);
    }
  }
}

extension DioErrorExt on DioError {
  WException get exception {
    final int code = response?.statusCode ?? 500;
    final String message = response?.data['message'] ?? 'Terjadi Kesalahan';

    if (type == DioErrorType.connectTimeout) {
      return const WException.badNetworkException();
    }

    switch (code) {
      case 401:
        return WException.unauthenticated(message: message);
      case 503:
        return WException.maintenance(message: message);
      default:
        return WException.serverException(message: message, code: code);
    }
  }
}
