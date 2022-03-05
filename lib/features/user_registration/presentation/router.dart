import 'package:nuvigator/next.dart';
import 'package:serotonina/core/presentation/routes/error.dart';
import 'package:serotonina/features/user_registration/presentation/routes/user_registration_route.dart';

class UserRegistrationRouter extends NuRouter {
  @override
  String get initialRoute => 'user-registration';

  @override
  List<NuRoute> get registerRoutes => [
        UserRegistrationRoute(),
        ErrorRoute(),
      ];
}
