import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_header.dart';
part '_section_title.dart';
part '_single_message.dart';

class MessagingPage extends StatelessWidget {
  const MessagingPage({super.key});

  static const String pageName = 'messaging';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Container(
      color: theme.colors.background,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _Header(),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  XXLargeGap(),
                  XXLargeGap(),
                  // const _SectionTitle(),
                  // XXMediumGap(),
                  const _SingleMessage(),
                  const _SingleMessage(isSender: true),
                  const _SingleMessage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
