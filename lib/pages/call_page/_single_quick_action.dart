part of 'call_page.dart';

class _SingleQuickAction extends StatefulWidget {
  const _SingleQuickAction({
    required this.iconPath,
    required this.label,
    required this.size,
    this.backgroundColor,
    this.iconColor,
    this.isSwitch,
    this.onPressed,
  });

  final String iconPath;
  final String label;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool? isSwitch;
  final VoidCallback? onPressed;

  @override
  State<_SingleQuickAction> createState() => _SingleQuickActionState();
}

class _SingleQuickActionState extends State<_SingleQuickAction> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);
    return FadeTapDetector(
      onTap: () {
        if (widget.isSwitch != null && widget.isSwitch!) {
          setState(() {
            isSelected = !isSelected;
          });
        }

        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: theme.durations.short,
            width: 80,
            height: 80,
            // padding: EdgeInsets.all(theme.spacing.xMedium),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _getBackgroundColor(),
            ),
            child: Center(
              child: SvgPicture.asset(
                widget.iconPath,
                width: widget.size,
                height: widget.size,
                color: _getIconColor(),
              ),
            ),
          ),
          SmallGap(),
          Text(
            widget.label,
            style: theme.text.callout.copyWith(color: theme.colors.background),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    final Color defaultColor = WebfabrikTheme.of(
      context,
    ).colors.translucentBackgroundContrast;

    if (widget.isSwitch != null && widget.isSwitch!) {
      return isSelected
          ? widget.backgroundColor ??
                WebfabrikTheme.of(context).colors.background
          : defaultColor;
    }

    return widget.backgroundColor ?? defaultColor;
  }

  Color _getIconColor() {
    final Color defaultColor = WebfabrikTheme.of(context).colors.background;
    final Color selectedColor = WebfabrikTheme.of(
      context,
    ).colors.backgroundContrast;

    if (widget.isSwitch != null && widget.isSwitch!) {
      return isSelected ? widget.iconColor ?? selectedColor : defaultColor;
    }

    return widget.iconColor ?? defaultColor;
  }
}
