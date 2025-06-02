part of 'medical_id_page.dart';

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return Divider(
      thickness: .8,
      color: theme.colors.backgroundContrast.withValues(alpha: .1),
    );
  }
}
