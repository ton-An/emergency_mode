import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

enum CustomIconButtonSize { medium, large }

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size = CustomIconButtonSize.large,
    this.backgroundColor,
    this.iconColor,
    this.label,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final CustomIconButtonSize size;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    final double iconSize = _getIconSize();
    final double backgroundSize = _getBackgroundSize();

    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          SmoothClipRRect(
            borderRadius: BorderRadius.circular(backgroundSize),
            child: Container(
              width: backgroundSize,
              height: backgroundSize,
              color:
                  backgroundColor ??
                  theme.colors.translucentBackgroundContrast.withValues(
                    alpha: .4,
                  ),
              child: Center(
                child: Icon(
                  icon,
                  size: iconSize,
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

  double _getIconSize() {
    switch (size) {
      case CustomIconButtonSize.medium:
        return 28;
      case CustomIconButtonSize.large:
        return 44;
    }
  }

  double _getBackgroundSize() {
    switch (size) {
      case CustomIconButtonSize.medium:
        return 58;
      case CustomIconButtonSize.large:
        return 78;
    }
  }
}
