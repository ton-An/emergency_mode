import 'package:flutter/material.dart';

class MedicalIdPage extends StatelessWidget {
  const MedicalIdPage({super.key});

  static const String pageName = 'medical_id';
  static const String route = '/$pageName';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('Medical ID'),
    );
  }
}
