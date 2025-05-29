part of 'siren_page.dart';

class _CountdownTimer extends StatefulWidget {
  const _CountdownTimer({required this.duration});

  final Duration duration;

  @override
  State<_CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<_CountdownTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _borderColorController;
  late Animation<Color?> _borderColorAnimation;

  late Timer _timer;

  int? _remaining;

  bool _didInitAnimation = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    if (!_didInitAnimation) {
      _borderColorController = AnimationController(
        duration: theme.durations.short,
        vsync: this,
      );

      _borderColorController.addListener(() {
        setState(() {});
      });

      _didInitAnimation = true;
    } else {
      _borderColorController.duration = theme.durations.xShort;
    }

    _borderColorAnimation =
        ColorTween(begin: theme.colors.error, end: theme.colors.text).animate(
          CurvedAnimation(
            parent: _borderColorController,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        );
  }

  void _startTimer() {
    _remaining ??= widget.duration.inMilliseconds;

    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_remaining! > 0) {
        setState(() {
          _remaining = _remaining! - 1;
        });
      } else {
        context.read<SirenCubit>().startSiren();
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return BlocConsumer<SirenCubit, SirenState>(
      listener: (BuildContext context, SirenState sirenState) {
        if (sirenState is SirenCountdownStopped) {
          _borderColorController.forward();
          _timer.cancel();
        }

        if (sirenState is SirenCountdown) {
          _borderColorController.reverse();
          _startTimer();
        }
      },
      builder: (BuildContext context, SirenState sirenState) {
        return Stack(
          children: [
            SizedBox(
              width: 240,
              height: 240,
              child: CircularProgressIndicator(
                value: _remaining! / widget.duration.inMilliseconds,
                strokeWidth: 20,
                strokeCap: StrokeCap.round,
                color: _borderColorAnimation.value,
                backgroundColor: theme.colors.fieldColor,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  (_remaining! / 1000).toStringAsFixed(0),
                  style: theme.text.largeTitle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 96,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
