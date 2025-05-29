import 'dart:io';
import 'dart:ui';

import 'package:emergency_mode/pages/emergency_contact_mode_page.dart';
import 'package:emergency_mode/pages/medical_id_page.dart';
import 'package:emergency_mode/pages/siren_page/siren_page.dart';
import 'package:emergency_mode/widgets/draggable_selector.dart';
import 'package:emergency_mode/widgets/large_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_selectors.dart';

class SOSPage extends StatefulWidget {
  const SOSPage({super.key});

  static const String pageName = 'sos_page';
  static const String route = '/$pageName';

  @override
  State<SOSPage> createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // iOS ignores this, uses brightness
        statusBarBrightness: Brightness.dark, // sets text color in status bar
        statusBarIconBrightness: Brightness.dark, // Android only
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Stack(
      children: [
        Positioned.fill(child: Image.asset('assets/images/wallpaper.png')),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
            child: Container(color: Colors.black.withValues(alpha: .6)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'SOS',
              style: theme.text.largeTitle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            _Selectors(),
            LargeIconButton(
              icon: Icons.clear_rounded,
              onPressed: () {
                exit(0);
              },
            ),
          ],
        ),
      ],
    );
  }
}
