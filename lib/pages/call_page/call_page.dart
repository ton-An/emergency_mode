import 'package:emergency_mode/widgets/blurred_wallpaper.dart';
import 'package:emergency_mode/widgets/fade_tap_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_header.dart';
part '_quick_actions.dart';
part '_single_quick_action.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  static const String pageName = 'call';
  static const String route = '/$pageName';

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return BlurredWallpaper(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: theme.colors.background.withValues(alpha: .1),
            ),
          ),
          Column(
            children: [
              Center(child: _Header()),
              Expanded(child: SizedBox()),
              _QuickActions(),
            ],
          ),
        ],
      ),
    );
  }
}
