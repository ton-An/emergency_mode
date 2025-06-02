part of 'medical_id_page.dart';

class _SmallSection extends StatelessWidget {
  const _SmallSection({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.text.callout.copyWith(
            height: 0,
            letterSpacing: -.3,
            fontWeight: FontWeight.w600,
            color: theme.colors.error,
          ),
        ),
        XTinyGap(),
        Text(content, style: theme.text.body.copyWith(letterSpacing: -.7)),
      ],
    );
  }
}
