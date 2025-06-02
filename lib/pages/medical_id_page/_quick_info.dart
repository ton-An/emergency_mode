part of 'medical_id_page.dart';

class _QuickInfo extends StatelessWidget {
  const _QuickInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jane Doe',
              style: theme.text.title3.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: -.2,
              ),
            ),
            SmallGap(),
            Text('28 years old', style: theme.text.callout),
            XTinyGap(),
            Text('German - Deutsch', style: theme.text.callout),
            XTinyGap(),
            Text(
              'ORGAN DONOR',
              style: theme.text.caption1.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          width: 88,
          height: 88,
          child: SmoothClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/images/profile_picture.png'),
          ),
        ),
      ],
    );
  }
}
