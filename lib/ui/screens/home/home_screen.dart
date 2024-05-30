import 'package:flutter/material.dart';
import 'package:my_flutter_template_application/l10n/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(context.l10n.home)),
    );
  }
}
