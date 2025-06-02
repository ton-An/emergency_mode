import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:emergency_mode/cubits/call_cubit/call_cubit.dart';
import 'package:emergency_mode/cubits/call_cubit/call_states.dart';
import 'package:emergency_mode/widgets/blurred_wallpaper.dart';
import 'package:emergency_mode/widgets/fade_tap_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

part '_header.dart';
part '_quick_actions.dart';
part '_single_quick_action.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  static const String pageName = 'call';
  static const String route = '/$pageName';

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  late List<CameraDescription> _cameras;
  CameraController? _cameraController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );

    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      context.read<CallCubit>().acceptCall();
    });

    _initCameras();
  }

  void _initCameras({CallState? callState}) async {
    _cameras = await availableCameras();

    late CameraDescription _selectedCamera;

    if (callState is CallBackVideoState) {
      _selectedCamera = _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );
    } else {
      _selectedCamera = _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );
    }

    _cameraController = CameraController(_selectedCamera, ResolutionPreset.max);
    _cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final WebfabrikThemeData theme = WebfabrikTheme.of(context);

    return BlocConsumer<CallCubit, CallState>(
      listener: (BuildContext context, CallState callState) {
        if (callState is CallFrontVideoState ||
            callState is CallBackVideoState) {
          _initCameras(callState: callState);
        }
      },
      builder: (BuildContext context, CallState callState) {
        return Stack(
          children: [
            Positioned.fill(
              child: BlurredWallpaper(
                child: Container(
                  color: theme.colors.background.withValues(alpha: .1),
                ),
              ),
            ),

            if (_cameraController != null)
              Center(
                child: Transform.scale(
                  scale: 1.7,
                  child: AnimatedOpacity(
                    duration: theme.durations.xxShort,
                    opacity:
                        callState is CallFrontVideoState ||
                            callState is CallBackVideoState
                        ? 1
                        : 0,
                    child: CameraPreview(_cameraController!),
                  ),
                ),
              ),
            Column(
              children: [
                Center(child: _Header()),
                Expanded(child: SizedBox()),
                _QuickActions(),
              ],
            ),
          ],
        );
      },
    );
  }
}
