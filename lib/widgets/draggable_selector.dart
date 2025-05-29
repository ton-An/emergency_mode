import 'package:flutter/cupertino.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class DraggableSelector extends StatelessWidget {
  const DraggableSelector({
    super.key,
    required this.label,
    required this.icon,
    this.iconColor,
    this.handleColor,
  });

  final String label;
  final IconData icon;
  final Color? iconColor;
  final Color? handleColor;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return SmoothClipRRect(
      borderRadius: BorderRadius.circular(72),
      child: Container(
        height: 74,
        color: theme.colors.translucentBackgroundContrast,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(4.3),
                child: SmoothClipRRect(
                  borderRadius: BorderRadius.circular(72),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      height: double.infinity,
                      color: handleColor ?? theme.colors.background,
                      child: Icon(
                        icon,
                        size: 38,
                        color: iconColor ?? theme.colors.error,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(flex: 9, child: SizedBox.expand()),
                Expanded(
                  flex: 40,
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        fontFamily: '.SF Pro Display',
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        height: 25 / 21,
                        letterSpacing: -1.3,
                        wordSpacing: 2,
                        color: theme.colors.background,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
