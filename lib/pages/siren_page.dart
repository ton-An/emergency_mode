import 'package:flutter/material.dart';

class SirenPage extends StatelessWidget {
  const SirenPage({super.key});

  static const String pageName = 'siren';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('Siren Page'),
    );
  }
}
