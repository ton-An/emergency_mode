import 'package:emergency_mode/pages/sos_page/sos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WebfabrikTheme(
      data: WebfabrikThemeData(
        colors: WebfabrikColorThemeData(
          translucentBackgroundContrast: Color.fromARGB(55, 255, 255, 255),
        ),
      ),
      child: CupertinoApp.router(
        routerConfig: GoRouter(
          initialLocation: SOSPage.route,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => SizedBox.shrink(),
              routes: [
                GoRoute(
                  path: SOSPage.pageName,
                  builder: (context, state) => const SOSPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
