part of 'call_page.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Padding(
      padding: EdgeInsetsGeometry.only(top: theme.spacing.xLarge * 2),
      child: Column(
        children: [
          Text(
            'Calling mobile...',
            style: theme.text.title2.copyWith(
              color: theme.colors.translucentBackground,
              letterSpacing: -1,
              fontWeight: FontWeight.w600,
              wordSpacing: -0,
            ),
          ),
          Text(
            'Olya',
            style: theme.text.largeTitle.copyWith(
              color: theme.colors.background,
              letterSpacing: -1,
              fontWeight: FontWeight.w700,
              wordSpacing: -0,
            ),
          ),
        ],
      ),
    );
  }
}
