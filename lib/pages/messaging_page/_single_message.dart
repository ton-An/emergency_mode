part of 'messaging_page.dart';

class _SingleMessage extends StatelessWidget {
  const _SingleMessage({this.isSender = false});

  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Align(
      alignment: isSender ? Alignment.topRight : Alignment.topLeft,
      child: Column(
        children: [
          SmoothClipRRect(
            borderRadius: BorderRadius.circular(theme.radii.large),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: theme.spacing.xxSmall,
                vertical: theme.spacing.xSmall,
              ),
              color: isSender
                  ? Color(0xFF37d65f)
                  : WebfabrikTheme.of(context).colors.fieldColor,
              child: Text(
                '''I need help!
My information: 
Name: Jane Doe
Age: 28
Blood group: A+
see complete Med ID''',
                style: theme.text.body.copyWith(
                  height: 1.2,
                  color: isSender ? theme.colors.background : theme.colors.text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
