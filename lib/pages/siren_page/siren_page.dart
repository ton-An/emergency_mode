import 'dart:async';

import 'package:emergency_mode/widgets/custom_icon_button.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: theme.spacing.large),
            child: Text(
              'Siren',
              style: theme.text.largeTitle.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Column(
            children: [
              _CountdownTimer(
                duration: const Duration(seconds: 5),
                onComplete: () {},
              ),
              LargeGap(),
              CustomIconButton(
                icon: CupertinoIcons.stop_fill,
                size: CustomIconButtonSize.medium,
                backgroundColor: theme.colors.error,
                onPressed: () {},
              ),
              XSmallGap(),
              RichText(
                text: TextSpan(
                  text: 'Press to ',
                  style: theme.text.subhead,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'stop',
                      style: theme.text.subhead.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: ' Siren!'),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: theme.spacing.xMedium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _MessageSendButton(
                  initialLabel: 'Send Message  112',
                  successLabel: '112 Conversation',
                ),
                MediumGap(),
                _MessageSendButton(
                  initialLabel: 'Notify Emergency Contact',
                  successLabel: 'Emergency Contact Conversation',
                  initialBackgroundColor: theme.colors.fieldColor,
                  initialTextColor: theme.colors.primary,
                  successBackgroundColor: theme.colors.fieldColor,
                  successTextColor: theme.colors.success,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
