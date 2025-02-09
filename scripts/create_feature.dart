import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Please provide a feature name.");
    return;
  }

  final featureName = arguments[0];
  final libDir = Directory('lib');
  final featureDir = Directory('lib/features/$featureName');

  // إنشاء المجلدات الأساسية
  _createDirectories(featureDir);

  // إنشاء الملفات المطلوبة
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
  _createFile('${featureDir.path}/presentation/bloc/${featureName}_bloc.dart');
  _createFile('${featureDir.path}/presentation/bloc/${featureName}_event.dart');
  _createFile('${featureDir.path}/presentation/bloc/${featureName}_state.dart');
  _createFile('${featureDir.path}/presentation/pages/${featureName}_page.dart');
  _createFile(
      '${featureDir.path}/presentation/widgets/${featureName}_widget.dart');
}

void _createFile(String filePath) {
  File(filePath).createSync(recursive: true);
}

// dart scripts/create_feature.dart ahmed