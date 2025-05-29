import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class LargeIconButton extends StatelessWidget {
  const LargeIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Column(
      children: [
        SmoothClipRRect(
          borderRadius: BorderRadius.circular(78),
          child: Container(
            width: 78,
            height: 78,
            color: theme.colors.translucentBackgroundContrast.withValues(
              alpha: .4,
            ),
            child: Center(
              child: Icon(
                Icons.clear_rounded,
                size: 44,
                color: theme.colors.background,
              ),
            ),
          ),
        ),
        SmallGap(),
        Text(
          'Cancel',
          style: theme.text.subhead.copyWith(color: theme.colors.background),
        ),
      ],
    );
  }
}
