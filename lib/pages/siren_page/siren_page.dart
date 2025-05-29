import 'package:emergency_mode/pages/siren_page/countdown_timer.dart';
import 'package:emergency_mode/widgets/large_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

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
          CountdownTimer(
            duration: const Duration(seconds: 30),
            onComplete: () {},
          ),
          LargeGap(),
          LargeIconButton(
            icon: CupertinoIcons.stop_fill,
            backgroundColor: theme.colors.error,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
