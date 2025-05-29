import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class LargeIconButton extends StatelessWidget {
  const LargeIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.label,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SmoothClipRRect(
            borderRadius: BorderRadius.circular(78),
            child: Container(
              width: 78,
              height: 78,
              color:
                  backgroundColor ??
                  theme.colors.translucentBackgroundContrast.withValues(
                    alpha: .4,
                  ),
              child: Center(
                child: Icon(
                  icon,
                  size: 44,
                  color: iconColor ?? theme.colors.background,
                ),
              ),
            ),
          ),
          if (label != null) ...[
            SmallGap(),
            Text(
              label!,
              style: theme.text.subhead.copyWith(
                color: theme.colors.background,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
