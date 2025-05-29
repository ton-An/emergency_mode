part of 'sos_page.dart';

class _Selectors extends StatelessWidget {
  const _Selectors({super.key});

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DraggableSelector(
            label: 'Siren',
            icon: CupertinoIcons.speaker_1_fill,
          ),
          XXMediumGap(),
          DraggableSelector(
            label: 'Medical ID',
            icon: CupertinoIcons.staroflife_fill,
          ),
          XXMediumGap(),
          DraggableSelector(
            label: 'Emergency 112',
            icon: CupertinoIcons.phone_fill,
            iconColor: theme.colors.background,
            handleColor: theme.colors.error,
          ),
          MediumGap(),
          Text(
            'Slide to contact Emergency Services',
            style: theme.text.subhead.copyWith(color: theme.colors.background),
          ),
        ],
      ),
    );
  }
}
