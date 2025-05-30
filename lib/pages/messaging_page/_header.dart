part of 'messaging_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    final double topSafeArea = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: topSafeArea + 4),
      height: 142,
      width: double.infinity,
      color: theme.colors.backgroundContrast.withValues(alpha: .045),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SmoothClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/images/app_icon.png'),
            ),
          ),
          SmallGap(),
          Text(
            '+1 (888) 555-1212',
            textAlign: TextAlign.center,
            style: theme.text.caption2.copyWith(
              fontSize: 11,
              color: theme.colors.text,
            ),
          ),
        ],
      ),
    );
  }
}
