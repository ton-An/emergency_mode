import 'package:flutter/material.dart';

class EmergencyContactModePage extends StatelessWidget {
  const EmergencyContactModePage({super.key});

  static const String pageName = 'emergency_contact_mode';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('Emergency Contact Mode'),
    );
  }
}
