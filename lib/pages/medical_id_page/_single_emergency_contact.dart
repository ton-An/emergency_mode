part of 'medical_id_page.dart';

class _SingleEmergencyContact extends StatelessWidget {
  const _SingleEmergencyContact({
    required this.relation,
    required this.name,
    required this.phoneNumber,
  });

  final String relation;
  final String name;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          relation,
          style: theme.text.footnote.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: theme.colors.hint,
          ),
        ),
        XTinyGap(),
        Text(name, style: theme.text.callout),
        Text(
          phoneNumber,
          style: theme.text.callout.copyWith(
            height: 0,
            color: theme.colors.primary,
          ),
        ),
      ],
    );
  }
}
