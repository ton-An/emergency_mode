import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:webfabrik_theme/webfabrik_theme.dart';

class OpenUpwardsPage extends CustomTransitionPage {
  OpenUpwardsPage({
    required BuildContext context,
    required super.child,
    super.key,
  }) : super(
         transitionDuration: WebfabrikTheme.of(context).durations.medium,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return SlideTransition(
             position: animation.drive(
               Tween<Offset>(
                 begin: const Offset(0, 1),
                 end: Offset.zero,
               ).chain(CurveTween(curve: Curves.easeInOut)),
             ),
             child: child,
           );
         },
       );
}
