import 'package:flutter/widgets.dart';

abstract class UIError {
  UIError();
  String getMessage(BuildContext context);
}
