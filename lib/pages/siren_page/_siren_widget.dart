part of 'siren_page.dart';

class _SirenWidget extends StatelessWidget {
  const _SirenWidget();

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return BlocBuilder<SirenCubit, SirenState>(
      builder: (BuildContext context, SirenState sirenState) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: AnimatedOpacity(
                duration: theme.durations.long,
                opacity: sirenState is SirenPlaying ? 1 : 0,
                child: Pulsator(
                  duration: Duration(seconds: 5),
                  count: 14,
                  style: PulseStyle(
                    borderWidth: 20,
                    opacityCurve: Curves.easeInQuint,
                    pulseCurve: Curves.easeIn,
                    color: theme.colors.background,
                    borderColor: theme.colors.fieldColor,
                  ),
                ),
              ),
            ),
            Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(240),
                border: Border.all(width: 20, color: theme.colors.fieldColor),
                color: sirenState is SirenPlaying
                    ? theme.colors.error
                    : theme.colors.background,
              ),
            ),
            AnimatedSwitcher(
              duration: theme.durations.medium,
              child: sirenState is SirenPlaying
                  ? Icon(
                      CupertinoIcons.speaker_1_fill,
                      size: 80,
                      color: theme.colors.background,
                    )
                  : Icon(
                      CupertinoIcons.speaker_slash_fill,
                      size: 80,
                      color: theme.colors.error,
                    ),
            ),
          ],
        );
      },
    );
  }
}
