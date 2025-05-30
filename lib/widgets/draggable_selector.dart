import 'package:flutter/cupertino.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class DraggableSelector extends StatefulWidget {
  const DraggableSelector({
    super.key,
    required this.label,
    required this.icon,
    required this.onSuccessfulDrag,
    this.iconColor,
    this.handleColor,
  });

  final String label;
  final IconData icon;
  final VoidCallback onSuccessfulDrag;
  final Color? iconColor;
  final Color? handleColor;

  @override
  State<DraggableSelector> createState() => _DraggableSelectorState();
}

class _DraggableSelectorState extends State<DraggableSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _pullBackController;
  late Animation<double> _pullBackAnimation;
  late Duration _maxPullBackDuration;

  bool _hasInitializedControllers = false;
  bool _isVisible = true;

  double _dragPosition = 0;

  final GlobalKey _containerKey = GlobalKey();

  static const double handleSize = 74;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    if (!_hasInitializedControllers) {
      _pullBackController = AnimationController(
        duration: theme.durations.medium,
        vsync: this,
      );

      _pullBackController.addListener(() {
        setState(() {});
      });

      _hasInitializedControllers = true;
    }

    _pullBackController.duration = theme.durations.medium;

    _maxPullBackDuration = theme.durations.medium;

    _pullBackAnimation = Tween<double>(
      begin: -1,
      end: 0,
    ).animate(_pullBackController);
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return AnimatedOpacity(
      duration: theme.durations.short,
      curve: Curves.ease,
      opacity: _isVisible ? 1 : 0,
      child: Align(
        alignment: Alignment.centerRight,
        child: Stack(
          children: [
            Container(
              key: _containerKey,
              height: handleSize,
              width: double.infinity,
              margin: EdgeInsets.only(
                left: _pullBackController.isAnimating
                    ? _pullBackAnimation.value
                    : _dragPosition,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(handleSize),
                color: theme.colors.translucentBackgroundContrast,
              ),
              child: GestureDetector(
                onHorizontalDragStart: (details) {
                  setState(() {
                    _dragPosition = 0;
                  });
                },
                onHorizontalDragUpdate: (details) {
                  final double delta = details.delta.dx;
                  final double newPosition = _dragPosition + delta;
                  final double containerWidth =
                      _containerKey.currentContext?.size?.width ?? 0;
                  final double draggableWidth = containerWidth - handleSize;
                  final double clampedPosition = newPosition.clamp(
                    0,
                    draggableWidth,
                  );

                  setState(() {
                    _dragPosition = clampedPosition;
                  });
                },
                onHorizontalDragEnd: (details) async {
                  final double containerWidth =
                      _containerKey.currentContext?.size?.width ?? 0;
                  final double draggableWidth = containerWidth - handleSize;

                  if (_dragPosition >= draggableWidth - 60) {
                    setState(() {
                      _isVisible = false;
                    });
                    await Future.delayed(theme.durations.short);
                    widget.onSuccessfulDrag();
                    await Future.delayed(theme.durations.medium);
                    _dragPosition = 0;
                    setState(() {
                      _isVisible = true;
                    });
                  } else {
                    _pullBackAnimation = Tween<double>(
                      begin: _dragPosition,
                      end: 0,
                    ).animate(_pullBackController);
                    final double draggedDistancePercentage =
                        _dragPosition / draggableWidth;
                    final Duration animationDuration =
                        _maxPullBackDuration * draggedDistancePercentage;
                    _pullBackController.value = 0;
                    _pullBackController.duration = animationDuration;
                    _pullBackController.forward();
                    _dragPosition = 0;
                  }
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(4.3),
                    child: SmoothClipRRect(
                      borderRadius: BorderRadius.circular(72),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          height: double.infinity,
                          color: widget.handleColor ?? theme.colors.background,
                          child: Icon(
                            widget.icon,
                            size: 38,
                            color: widget.iconColor ?? theme.colors.error,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Row(
                children: [
                  Expanded(flex: 9, child: SizedBox.expand()),
                  Expanded(
                    flex: 40,
                    child: Center(
                      child: AnimatedOpacity(
                        duration: theme.durations.tiny,
                        opacity: _calculateHandlePosition() < 35 ? 1 : 0,
                        child: AnimatedOpacity(
                          duration: theme.durations.short,
                          opacity: _calculateHandlePosition() < 20 ? 1 : 0,
                          child: Text(
                            widget.label,
                            style: TextStyle(
                              fontFamily: '.SF Pro Display',
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              height: 25 / 21,
                              letterSpacing: -1.3,
                              wordSpacing: 2,
                              color: theme.colors.background,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateHandlePosition() {
    late double handlePosition;
    if (_pullBackController.isAnimating) {
      handlePosition = _pullBackAnimation.value;
    } else {
      handlePosition = _dragPosition;
    }

    return handlePosition;
  }
}
