import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredWallpaper extends StatelessWidget {
  const BlurredWallpaper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset('assets/images/wallpaper.png')),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
            child: Container(color: Colors.black.withValues(alpha: .6)),
          ),
        ),
        child,
      ],
    );
  }
}
