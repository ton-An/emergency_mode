import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_header.dart';
part '_message_field.dart';
part '_message_pill.dart';
part '_section_title.dart';
part '_single_message.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  static const String pageName = 'messaging';
  static const String route = '/$pageName';

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    );
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Container(
      color: theme.colors.background,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XXLargeGap(),
                  const _SectionTitle(),
                  XSmallGap(),
                  const _SingleMessage(),
                  const _SingleMessage(isSender: true),
                  const _SingleMessage(), const _SingleMessage(),
                  // const _SingleMessage(isSender: true),
                  const _SingleMessage(), const _SingleMessage(isSender: true),
                  const _SingleMessage(isSender: true),
                  const _SingleMessage(isSender: true),
                  const _SingleMessage(isSender: true),
                  const _SingleMessage(isSender: true),
                ],
              ),
            ),
          ),
          _Header(),
          Align(alignment: Alignment.bottomCenter, child: _MessageField()),
        ],
      ),
    );
  }
}
