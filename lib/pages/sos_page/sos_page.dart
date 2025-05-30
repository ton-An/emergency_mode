import 'dart:io';
import 'dart:ui';

import 'package:emergency_mode/cubits/sos_cubit/sos_cubit.dart';
import 'package:emergency_mode/cubits/sos_cubit/sos_states.dart';
import 'package:emergency_mode/pages/medical_id_page.dart';
import 'package:emergency_mode/pages/siren_page/siren_page.dart';
import 'package:emergency_mode/widgets/custom_icon_button.dart';
import 'package:emergency_mode/widgets/draggable_selector.dart';
import 'package:emergency_mode/widgets/x_large_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_contact_modes.dart';
part '_selectors.dart';

class SOSPage extends StatefulWidget {
  const SOSPage({super.key});

  static const String pageName = 'sos_page';
  static const String route = '/$pageName';

  @override
  State<SOSPage> createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> with TickerProviderStateMixin {
  late AnimationController _transitionController;
  late Animation<double> _transition;
  late AnimationController _blurController;
  late Animation<double> _blurTransition;

  bool _hasInitializedControllers = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    final Duration transitionDuration = theme.durations.short;

    if (!_hasInitializedControllers) {
      _transitionController = AnimationController(
        duration: transitionDuration,
        vsync: this,
      );

      _blurController = AnimationController(
        duration: transitionDuration * .5,
        vsync: this,
      );

      _transitionController.addListener(() {
        setState(() {});
      });

      _blurController.addListener(() {
        setState(() {});
      });

      _blurController.addStatusListener((AnimationStatus status) {
        if (status.isCompleted) {
          _blurController.reverse();
        }
      });

      _hasInitializedControllers = true;
    }

    _transitionController.duration = transitionDuration;
    _blurController.duration = transitionDuration * .5;

    _transition = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_transitionController);

    _blurTransition = Tween<double>(begin: 0, end: 3).animate(
      CurvedAnimation(
        parent: _blurController,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return BlocConsumer<SOSCubit, SOSState>(
      listener: (context, state) {
        if (state is SOSInitial) {
          _transitionController.reverse();
          _blurController.forward();
        } else if (state is SOSContactModeSelection) {
          _transitionController.forward();
          _blurController.forward();
        }
      },
      builder: (BuildContext context, SOSState sosState) {
        return Stack(
          children: [
            Positioned.fill(child: Image.asset('assets/images/wallpaper.png')),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                child: Container(color: Colors.black.withValues(alpha: .6)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(top: theme.spacing.large),
                  child: Text(
                    'SOS',
                    style: theme.text.largeTitle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    _ContentTransition(
                      value: 1 - _transition.value,
                      child: _Selectors(),
                    ),
                    _ContentTransition(
                      value: _transition.value,
                      child: _ContactModes(),
                    ),
                    Positioned.fill(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: _blurTransition.value,
                            sigmaY: _blurTransition.value,
                          ),
                          child: Container(),
                        ),
                      ),
                    ),
                  ],
                ),

                CustomIconButton(
                  icon: Icons.clear_rounded,
                  label: sosState is SOSInitial ? 'Cancel' : 'Back',
                  onPressed: () {
                    if (sosState is SOSInitial) {
                      exit(0);
                    } else if (sosState is SOSContactModeSelection) {
                      context.read<SOSCubit>().toInitial();
                    }
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ContentTransition extends StatelessWidget {
  const _ContentTransition({required this.value, required this.child});

  final double value;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: value == 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(opacity: value, child: child),
          Positioned.fill(child: ClipRect(child: Container())),
        ],
      ),
    );
  }
}
