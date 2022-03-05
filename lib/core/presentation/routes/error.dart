import 'package:flutter/cupertino.dart';
import 'package:nuvigator/next.dart';
import 'package:serotonina/core/presentation/pages/error.dart';

class ErrorRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object> settings) {
    return ErrorScreen();
  }

  @override
  String get path => 'error';

  @override
  ScreenType get screenType => materialScreenType;
}
