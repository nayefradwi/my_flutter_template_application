import 'package:my_flutter_template_application/data/entities/example.dart';
import 'package:my_flutter_template_application/domain/models/example.dart';
import 'package:nayef_common_domain_toolkit/nayef_common_domain_toolkit.dart';

// TODO: delete this once you have your own mappers
class ExampleMapper with IListMapper<ExampleModel, ExampleEntity> {
  @override
  ExampleModel from(ExampleEntity other) {
    return ExampleModel(id: other.id, name: other.name);
  }
}
