//cmd  flutter packages pub run build_runner build --delete-conflicting-outputs
import 'package:auto_route/auto_route.dart';

import '/screens/home_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: "Screen,Route",
  routes: [
    AutoRoute(
      page: HomeScreen,
      initial: true,
    ),
  ],
)
class $AppRouter {}
