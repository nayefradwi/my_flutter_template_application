import 'package:flutter/material.dart';
import 'package:my_flutter_template_application/core/bootstrap.dart';
import 'package:my_flutter_template_application/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const MainApp());
}
