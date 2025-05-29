import 'package:emergency_mode/cubits/siren_cubit.dart';
import 'package:emergency_mode/pages/emergency_contact_mode_page.dart';
import 'package:emergency_mode/pages/medical_id_page.dart';
import 'package:emergency_mode/pages/siren_page/siren_page.dart';
import 'package:emergency_mode/pages/sos_page/sos_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WebfabrikTheme(
      data: WebfabrikThemeData(
        colors: WebfabrikColorThemeData(
          translucentBackgroundContrast: Color.fromARGB(55, 255, 255, 255),
        ),
      ),
      child: CupertinoApp.router(routerConfig: _routes),
    );
  }

  final GoRouter _routes = GoRouter(
    initialLocation: SOSPage.route,
    routes: [
      GoRoute(
        path: SOSPage.route,
        builder: (context, state) => const SOSPage(),
      ),
      GoRoute(
        path: MedicalIdPage.route,
        builder: (context, state) => const MedicalIdPage(),
      ),
      GoRoute(
        path: EmergencyContactModePage.route,
        builder: (context, state) => const EmergencyContactModePage(),
      ),
      GoRoute(
        path: SirenPage.route,
        builder: (context, state) => BlocProvider(
          create: (context) => SirenCubit(),
          child: const SirenPage(),
        ),
      ),
    ],
  );
}
