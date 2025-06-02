import 'package:emergency_mode/cubits/siren_cubit/siren_cubit.dart';
import 'package:emergency_mode/cubits/sos_cubit/sos_cubit.dart';
import 'package:emergency_mode/pages/call_page/call_page.dart';
import 'package:emergency_mode/pages/emergency_contact_mode_page.dart';
import 'package:emergency_mode/pages/medical_id_page.dart';
import 'package:emergency_mode/pages/messaging_page/messaging_page.dart';
import 'package:emergency_mode/pages/siren_page/siren_page.dart';
import 'package:emergency_mode/pages/sos_page/sos_page.dart';
import 'package:emergency_mode/widgets/open_upwards_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestPermissions();
  }

  void _requestPermissions() async {
    await Permission.camera.request();
  }

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
        builder: (context, state) => BlocProvider(
          create: (context) => SOSCubit(),
          child: const SOSPage(),
        ),
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
        pageBuilder: (context, state) => OpenUpwardsPage(
          context: context,
          child: BlocProvider(
            create: (context) => SirenCubit(),
            child: const SirenPage(),
          ),
        ),
      ),
      GoRoute(
        path: MessagingPage.route,
        pageBuilder: (context, state) =>
            OpenUpwardsPage(context: context, child: const MessagingPage()),
      ),
      GoRoute(
        path: CallPage.route,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
          child: const CallPage(),
        ),
      ),
    ],
  );
}
