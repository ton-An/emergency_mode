part of 'messaging_page.dart';

class _SectionTitle extends StatelessWidget {
  const _SectionTitle();

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Text(
      'SMS\nToday ${DateFormat.Hm().format(DateTime.now())}',
      style: theme.text.caption2.copyWith(
        fontWeight: FontWeight.w500,
        color: theme.colors.hint,
      ),
      textAlign: TextAlign.center,
    );
  }
}
