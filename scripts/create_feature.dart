import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Please provide a feature name.");
    return;
  }

  final featureName = arguments[0];
  final libDir = Directory('lib');
  final featureDir = Directory('lib/features/$featureName');

  // Create the basic directories
  _createDirectories(featureDir);

  // Create the required files
  _createFiles(featureName, featureDir);

  print("Feature '$featureName' created successfully!");
}

void _createDirectories(Directory featureDir) {
  final directories = [
    '${featureDir.path}/domain/entities',
    '${featureDir.path}/domain/repositories',
    '${featureDir.path}/domain/useCases',
    '${featureDir.path}/data/models',
    '${featureDir.path}/data/repositories',
    '${featureDir.path}/data/dataSources',
    '${featureDir.path}/presentation/bloc',
    '${featureDir.path}/presentation/pages',
    '${featureDir.path}/presentation/widgets',
  ];

  for (final dir in directories) {
    Directory(dir).createSync(recursive: true);
  }
}

void _createFiles(String featureName, Directory featureDir) {
  // Domain
  _createFile('${featureDir.path}/domain/entities/${featureName}_entity.dart');
  _createFile(
      '${featureDir.path}/domain/repositories/${featureName}_repository.dart');
  _createFile('${featureDir.path}/domain/useCases/get_${featureName}.dart');

  // Data
  _createFile('${featureDir.path}/data/models/${featureName}_model.dart');
  _createFile(
      '${featureDir.path}/data/repositories/${featureName}_repository_impl.dart');
  _createFile(
      '${featureDir.path}/data/dataSources/${featureName}_remote_data_source.dart');
  _createFile(
      '${featureDir.path}/data/dataSources/${featureName}_local_data_source.dart');

  // Presentation
  _createBlocFiles(featureName, featureDir);
  _createStatelessPage(featureName, featureDir);
  _createFile(
      '${featureDir.path}/presentation/widgets/${featureName}_widget.dart');
}

void _createFile(String filePath) {
  File(filePath).createSync(recursive: true);
}

void _createBlocFiles(String featureName, Directory featureDir) {
  final blocPath =
      '${featureDir.path}/presentation/bloc/${featureName}_bloc.dart';
  final eventPath =
      '${featureDir.path}/presentation/bloc/${featureName}_event.dart';
  final statePath =
      '${featureDir.path}/presentation/bloc/${featureName}_state.dart';

  final capitalizedFeatureName =
      featureName[0].toUpperCase() + featureName.substring(1);

  // Create and write to the bloc file
  File(blocPath).writeAsStringSync('''
import 'package:flutter_bloc/flutter_bloc.dart';
import '${featureName}_event.dart';
import '${featureName}_state.dart';

class ${capitalizedFeatureName}Bloc extends Bloc<${capitalizedFeatureName}Event, ${capitalizedFeatureName}State> {
  ${capitalizedFeatureName}Bloc() : super(${capitalizedFeatureName}Initial()) {
    on<${capitalizedFeatureName}Started>(_on${capitalizedFeatureName}Started);
  }

  void _on${capitalizedFeatureName}Started(
    ${capitalizedFeatureName}Started event,
    Emitter<${capitalizedFeatureName}State> emit,
  ) async {
    // TODO: implement event handler
  }
}
''');

  // Create and write to the event file
  File(eventPath).writeAsStringSync('''
abstract class ${capitalizedFeatureName}Event {}

class ${capitalizedFeatureName}Started extends ${capitalizedFeatureName}Event {}
''');

  // Create and write to the state file
  File(statePath).writeAsStringSync('''
abstract class ${capitalizedFeatureName}State {}

class ${capitalizedFeatureName}Initial extends ${capitalizedFeatureName}State {}

class ${capitalizedFeatureName}Loading extends ${capitalizedFeatureName}State {}

class ${capitalizedFeatureName}Loaded extends ${capitalizedFeatureName}State {
  final dynamic data;

  ${capitalizedFeatureName}Loaded(this.data);
}

class ${capitalizedFeatureName}Error extends ${capitalizedFeatureName}State {
  final String message;

  ${capitalizedFeatureName}Error(this.message);
}
''');
}

void _createStatelessPage(String featureName, Directory featureDir) {
  final pagePath =
      '${featureDir.path}/presentation/pages/${featureName}_page.dart';
  final capitalizedFeatureName =
      featureName[0].toUpperCase() + featureName.substring(1);

  File(pagePath).writeAsStringSync('''
import 'package:flutter/material.dart';

class ${capitalizedFeatureName}Page extends StatelessWidget {
  const ${capitalizedFeatureName}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${capitalizedFeatureName}'),
      ),
      body: Center(
        child: Text('${capitalizedFeatureName} Page'),
      ),
    );
  }
}
''');
}
// import 'dart:io';

// void main(List<String> arguments) {
//   if (arguments.isEmpty) {
//     print("Please provide a feature name.");
//     return;
//   }

//   final featureName = arguments[0];
//   final libDir = Directory('lib');
//   final featureDir = Directory('lib/features/$featureName');

//   // إنشاء المجلدات الأساسية
//   _createDirectories(featureDir);

//   // إنشاء الملفات المطلوبة
//   _createFiles(featureName, featureDir);

//   print("Feature '$featureName' created successfully!");
// }

// void _createDirectories(Directory featureDir) {
//   final directories = [
//     '${featureDir.path}/domain/entities',
//     '${featureDir.path}/domain/repositories',
//     '${featureDir.path}/domain/useCases',
//     '${featureDir.path}/data/models',
//     '${featureDir.path}/data/repositories',
//     '${featureDir.path}/data/dataSources',
//     '${featureDir.path}/presentation/bloc',
//     '${featureDir.path}/presentation/pages',
//     '${featureDir.path}/presentation/widgets',
//   ];

//   for (final dir in directories) {
//     Directory(dir).createSync(recursive: true);
//   }
// }

// void _createFiles(String featureName, Directory featureDir) {
//   // Domain
//   _createFile('${featureDir.path}/domain/entities/${featureName}_entity.dart');
//   _createFile(
//       '${featureDir.path}/domain/repositories/${featureName}_repository.dart');
//   _createFile('${featureDir.path}/domain/useCases/get_${featureName}.dart');

//   // Data
//   _createFile('${featureDir.path}/data/models/${featureName}_model.dart');
//   _createFile(
//       '${featureDir.path}/data/repositories/${featureName}_repository_impl.dart');
//   _createFile(
//       '${featureDir.path}/data/dataSources/${featureName}_remote_data_source.dart');
//   _createFile(
//       '${featureDir.path}/data/dataSources/${featureName}_local_data_source.dart');

//   // Presentation
//   _createFile('${featureDir.path}/presentation/bloc/${featureName}_bloc.dart');
//   _createFile('${featureDir.path}/presentation/bloc/${featureName}_event.dart');
//   _createFile('${featureDir.path}/presentation/bloc/${featureName}_state.dart');
//   _createFile('${featureDir.path}/presentation/pages/${featureName}_page.dart');
//   _createFile(
//       '${featureDir.path}/presentation/widgets/${featureName}_widget.dart');
// }

// void _createFile(String filePath) {
//   File(filePath).createSync(recursive: true);
// }

// // dart scripts/create_feature.dart ahmed