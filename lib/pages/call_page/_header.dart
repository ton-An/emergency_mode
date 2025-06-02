part of 'call_page.dart';

class _Header extends StatefulWidget {
  const _Header({super.key});

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  Timer? callDuration;
  int durationInSeconds = 0;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return BlocConsumer<CallCubit, CallState>(
      listener: (context, state) {
        if (state is CallAudioOnlyState && callDuration == null) {
          callDuration = Timer.periodic(const Duration(seconds: 1), (timer) {
            setState(() {
              durationInSeconds++;
            });
          });
        }
      },
      builder: (BuildContext context, CallState callState) {
        return Padding(
          padding: EdgeInsetsGeometry.only(top: theme.spacing.xLarge * 2),
          child: Column(
            children: [
              Text(
                callDuration == null
                    ? 'Calling...'
                    : _getFormattedCallDuration(),
                style: theme.text.title2.copyWith(
                  color: theme.colors.translucentBackground,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w600,
                  wordSpacing: -0,
                ),
              ),
              Text(
                '112',
                style: theme.text.largeTitle.copyWith(
                  color: theme.colors.background,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                  wordSpacing: -0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getFormattedCallDuration() {
    final int minutes = durationInSeconds ~/ 60;
    final int seconds = durationInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
