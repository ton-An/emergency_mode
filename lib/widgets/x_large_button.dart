import 'package:emergency_mode/widgets/fade_tap_detector.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class XLargeButton extends StatelessWidget {
  const XLargeButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return FadeTapDetector(
      onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SmoothClipRRect(
            borderRadius: BorderRadius.circular(theme.radii.xLarge),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: theme.spacing.xxMedium),
              color: theme.colors.translucentBackgroundContrast,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(theme.spacing.xxSmall),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colors.translucentBackgroundContrast,
                    ),
                    child: Icon(icon, size: 48, color: theme.colors.background),
                  ),
                  XXMediumGap(),
                  Text(
                    label,
                    style: WebfabrikTheme.of(context).text.title3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colors.background,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
