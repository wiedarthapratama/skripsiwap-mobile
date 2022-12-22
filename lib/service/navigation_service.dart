import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skripsi_wap/config/injection.dart';
import 'package:skripsi_wap/config/route.gr.dart';

final _appRouter = Injection.locator<AppRouter>();
final _navKey = _appRouter.navigatorKey;

class NavigationService {
  AppRouter get router => _appRouter;
  GlobalKey<NavigatorState> get navigationKey => _navKey;

  BuildContext? get currentContext => _navKey.currentContext;

  Future<T?> pushToWidget<T>(Widget widget, {bool animation = false}) async {
    return router.pushWidget<T>(widget,
        transitionBuilder: TransitionsBuilders.slideBottom,
        transitionDuration: const Duration(milliseconds: 200));
  }

  Future<T?> popToRootAndPushTo<T>(PageRouteInfo<dynamic> route) async {
    return router.pushAndPopUntil<T>(route,
        predicate: (route) => route.isFirst);
  }

  Future<dynamic> popToRootAndReplaceWith(PageRouteInfo<dynamic> route) async {
    router.popUntilRoot();
    return router.replace(route);
  }
}
