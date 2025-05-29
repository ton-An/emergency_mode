import 'dart:async';

import 'package:emergency_mode/widgets/large_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_countdown_timer.dart';
part '_message_send_button.dart';

class SirenPage extends StatelessWidget {
  const SirenPage({super.key});

  static const String pageName = 'siren';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CountdownTimer(
            duration: const Duration(seconds: 30),
            onComplete: () {},
          ),
          LargeGap(),
          LargeIconButton(
            icon: CupertinoIcons.stop_fill,
            backgroundColor: theme.colors.error,
            onPressed: () {},
          ),
          LargeGap(),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: theme.spacing.xMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
