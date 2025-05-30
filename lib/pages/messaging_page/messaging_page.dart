import 'package:flutter/cupertino.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class MessagingPage extends StatelessWidget {
  const MessagingPage({super.key});

  static const String pageName = 'messaging';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Container(color: theme.colors.background);
  }
}
