import 'dart:async';

import 'package:emergency_mode/cubits/siren_cubit.dart';
import 'package:emergency_mode/cubits/siren_states.dart';
import 'package:emergency_mode/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsator/pulsator.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_countdown_timer.dart';
part '_message_send_button.dart';
part '_siren_widget.dart';

class SirenPage extends StatelessWidget {
  const SirenPage({super.key});

  static const String pageName = 'siren';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return BlocBuilder<SirenCubit, SirenState>(
      builder: (BuildContext context, SirenState sirenState) {
        final bool isActive = _isActive(sirenState: sirenState);
        final Color textColor = sirenState is SirenPlaying
            ? theme.colors.background
            : theme.colors.text;

        return AnimatedContainer(
          duration: theme.durations.medium,
          alignment: Alignment.center,
          color: sirenState is SirenPlaying
              ? theme.colors.error
              : theme.colors.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: theme.spacing.large),
                child: Text(
                  'Siren',
                  style: theme.text.largeTitle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
              ),

              Column(
                children: [
                  AnimatedSwitcher(
                    duration: theme.durations.medium,
                    child:
                        sirenState is SirenCountdown ||
                            sirenState is SirenCountdownStopped
                        ? _CountdownTimer(duration: const Duration(seconds: 5))
                        : SizedOverflowBox(
                            size: Size(240, 240),
                            child: _SirenWidget(),
                          ),
                  ),
                  LargeGap(),
                  CustomIconButton(
                    icon: isActive
                        ? Icons.stop_rounded
                        : Icons.play_arrow_rounded,
                    size: CustomIconButtonSize.medium,
                    backgroundColor: isActive
                        ? sirenState is SirenPlaying
                              ? theme.colors.background
                              : theme.colors.error
                        : theme.colors.success,
                    iconColor: sirenState is SirenPlaying
                        ? theme.colors.error
                        : theme.colors.background,
                    onPressed: () {
                      context.read<SirenCubit>().toggleSiren();
                    },
                  ),
                  XSmallGap(),
                  RichText(
                    text: TextSpan(
                      text: 'Press to ',
                      style: theme.text.subhead.copyWith(color: textColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: isActive ? 'stop' : 'start',
                          style: theme.text.subhead.copyWith(
                            fontWeight: sirenState is SirenPlaying
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: textColor,
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
                      initialLabel: 'Notify Emergency Contacts',
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
      },
    );
  }

  bool _isActive({required SirenState sirenState}) {
    return sirenState is SirenCountdown || sirenState is SirenPlaying;
  }
}
