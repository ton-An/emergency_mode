part of 'messaging_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    final double topSafeArea = MediaQuery.of(context).padding.top;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Container(
          padding: EdgeInsets.only(top: topSafeArea + 4),
          height: 120,
          width: double.infinity,
          color: theme.colors.translucentBackground.withValues(alpha: .75),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Text 112',
                  textAlign: TextAlign.center,
                  style: theme.text.title3.copyWith(
                    // fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: theme.colors.text,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    right: theme.spacing.medium + theme.spacing.small,
                  ),
                  child: Icon(
                    CupertinoIcons.phone,
                    size: 24,
                    color: theme.colors.backgroundContrast,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
