import 'dart:io';

import 'package:emergency_mode/widgets/fade_tap_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_divider.dart';
part '_emergency_contacts.dart';
part '_header.dart';
part '_quick_info.dart';
part '_single_emergency_contact.dart';
part '_small_section.dart';

class MedicalIdPage extends StatelessWidget {
  const MedicalIdPage({super.key});

  static const String pageName = 'medical_id';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.colors.error.withValues(alpha: .2),
                  theme.colors.error.withValues(alpha: 0),
                ],
              ),
            ),
          ),
          Column(
            children: [
              _Header(),
              LargeGap(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: theme.spacing.xMedium + theme.spacing.small,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _QuickInfo(),
                    MediumGap(),
                    _Divider(),
                    MediumGap(),
                    _SmallSection(
                      title: 'Medications',
                      content: 'Aspirin 500mg',
                    ),
                    XSmallGap(),
                    _Divider(),
                    XSmallGap(),
                    _SmallSection(title: 'Allergies', content: 'Kiwi, Bees'),
                    XSmallGap(),
                    _Divider(),
                    XSmallGap(),
                    _EmergencyContacts(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
