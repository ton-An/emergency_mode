part of 'medical_id_page.dart';

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    final double topSafeArea = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topSafeArea),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: theme.spacing.medium,
                vertical: theme.spacing.small,
              ),
              child: Text(
                'Done',
                style: theme.text.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colors.primary,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.staroflife_fill,
                    size: 21,
                    color: theme.colors.error,
                  ),
                  XTinyGap(),
                  Text(
                    'Medical ID',
                    style: theme.text.subhead.copyWith(
                      height: 0,
                      letterSpacing: -.2,
                      fontWeight: FontWeight.w600,
                      color: theme.colors.error,
                    ),
                  ),
                ],
              ),
              XTinyGap(),
              Text(
                'Updated 2. Mai 2025',
                style: theme.text.footnote.copyWith(color: theme.colors.text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
