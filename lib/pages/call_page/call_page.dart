import 'package:emergency_mode/widgets/blurred_wallpaper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_header.dart';

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
    return BlurredWallpaper(
      child: Column(children: [Center(child: _Header())]),
    );
  }
}
