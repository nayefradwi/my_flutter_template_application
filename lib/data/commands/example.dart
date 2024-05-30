import 'package:nayef_common_data_toolkit/nayef_common_data_toolkit.dart';

// TODO: delete this when you have your own commands
class ExampleCommand with JsonCommand {
  @override
  Map<String, dynamic> generate() {
    return {
      'example': 'example',
    };
  }
}
