part of 'siren_page.dart';

enum _States { initial, sending, sent, chatRedirect }

class _MessageSendButton extends StatefulWidget {
  const _MessageSendButton({
    required this.initialLabel,
    required this.successLabel,
    this.initialBackgroundColor,
    this.successBackgroundColor,
    this.initialTextColor,
    this.successTextColor,
  });

  final String initialLabel;
  final String successLabel;

  final Color? initialBackgroundColor;
  final Color? successBackgroundColor;

  final Color? initialTextColor;
  final Color? successTextColor;

  @override
  State<_MessageSendButton> createState() => _MessageSendButtonState();
}

class _MessageSendButtonState extends State<_MessageSendButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  bool _hasInitializedControllers = false;
  _States _state = _States.initial;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    if (!_hasInitializedControllers) {
      _colorController = AnimationController(
        vsync: this,
        duration: theme.durations.short,
      );

      _colorAnimation = ColorTween(
        begin: widget.initialBackgroundColor ?? theme.colors.primary,
        end: widget.successBackgroundColor ?? theme.colors.success,
      ).animate(_colorController);

      _colorAnimation.addListener(() {
        setState(() {});
      });

      _hasInitializedControllers = true;
    } else {
      _colorController.duration = theme.durations.short;
      _colorAnimation = ColorTween(
        begin: widget.initialBackgroundColor ?? theme.colors.primary,
        end: widget.successBackgroundColor ?? theme.colors.success,
      ).animate(_colorController);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _colorController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return CustomCupertinoButton(
      color: _colorAnimation.value,
      onPressed: _onPressed,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _buildButtonContent(theme: theme),
      ),
    );
  }

  Widget _buildButtonContent({required WebfabrikThemeData theme}) {
    switch (_state) {
      case _States.initial:
        return Text(
          widget.initialLabel,
          textAlign: TextAlign.center,
          style: WebfabrikTheme.of(context).text.headline.copyWith(
            color:
                widget.initialTextColor ??
                WebfabrikTheme.of(context).colors.primaryContrast,
            height: 1,
          ),
        );
      case _States.sending:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              color: widget.initialTextColor ?? theme.colors.primaryContrast,
            ),
            XSmallGap(),
            Text(
              'Sending...',
              textAlign: TextAlign.center,
              style: WebfabrikTheme.of(context).text.headline.copyWith(
                height: 1,
                color:
                    widget.initialTextColor ??
                    WebfabrikTheme.of(context).colors.primaryContrast,
              ),
            ),
          ],
        );
      case _States.sent:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.checkmark_circle_fill,
              size: 20,
              color: widget.successTextColor ?? theme.colors.primaryContrast,
            ),
            XSmallGap(),
            Text(
              widget.successLabel,
              textAlign: TextAlign.center,
              style: WebfabrikTheme.of(context).text.headline.copyWith(
                height: 1,
                color:
                    widget.successTextColor ??
                    WebfabrikTheme.of(context).colors.primaryContrast,
              ),
            ),
          ],
        );
      case _States.chatRedirect:
        return Text(
          widget.successLabel,
          textAlign: TextAlign.center,
          style: WebfabrikTheme.of(context).text.headline.copyWith(
            height: 1,
            color:
                widget.successTextColor ??
                WebfabrikTheme.of(context).colors.primaryContrast,
          ),
        );
    }
  }

  void _onPressed() async {
    if (_state == _States.initial) {
      setState(() {
        _state = _States.sending;
      });
      // Simulate sending message
      await Future.delayed(const Duration(seconds: 2), () {});

      _colorController.forward();

      await Future.delayed(const Duration(milliseconds: 100), () {});

      setState(() {
        _state = _States.sent;
      });

      await Future.delayed(Duration(milliseconds: 3500));

      setState(() {
        _state = _States.chatRedirect;
      });
    }
  }
}
