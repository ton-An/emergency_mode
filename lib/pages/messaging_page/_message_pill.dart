part of 'messaging_page.dart';

class _MessagePill extends StatelessWidget {
  const _MessagePill({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.xxSmall,
        vertical: theme.spacing.xSmall + theme.spacing.xTiny,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(23, 0, 0, 0),
        borderRadius: BorderRadius.circular(theme.radii.small),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colors.primary),
          SizedBox(width: theme.spacing.xxSmall),
          Text(
            label,
            style: theme.text.subhead.copyWith(
              height: 1,
              color: theme.colors.text,
            ),
          ),
        ],
      ),
    );
  }
}
