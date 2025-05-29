import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    super.key,
    required this.duration,
    required this.onComplete,
  });

  final Duration duration;
  final VoidCallback onComplete;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remaining;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remaining = widget.duration.inMilliseconds;
    _timer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      if (_remaining > 0) {
        setState(() => _remaining--);
      } else {
        widget.onComplete();
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
    return Stack(
      children: [
        SizedBox(
          width: 240,
          height: 240,
          child: CircularProgressIndicator(
            value: _remaining / widget.duration.inMilliseconds,
            strokeWidth: 20,
            strokeCap: StrokeCap.round,
            color: theme.colors.error,
            backgroundColor: theme.colors.fieldColor,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              (_remaining / 1000).toStringAsFixed(0),
              style: theme.text.largeTitle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 96,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
