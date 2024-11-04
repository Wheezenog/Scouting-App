import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class JsonFunctions {
  late String fileName;
  static Logger log = Logger(printer: PrettyPrinter(methodCount: 0));

  JsonFunctions(this.fileName);

  // Initialize the file, make sure it does not have old data.
  void fileInit(File file) {
    if (file.existsSync()) {
      file.deleteSync();
    }
    file.createSync();
  }

  // The getter used for the json file in question.
Future<File> get _jsonFile async {
  Directory? dir = await getTemporaryDirectory();
  dir.createSync();
  return File('${dir.path}/$fileName.json');
}

  /// Writes [Map] data to a file.
  ///
  /// + [key] The key assigned to the file. NOTE:
  ///   - NOTE: If key already exists within the file, the new value will replace the old one.
  /// + [value] The value assigned to the given key.
  void writeToFile(String key, dynamic value) async {
    File file = await _jsonFile;
    log.d('writing to file...');
    Map<String, dynamic> fileContents = await readFromJsonFile();
    var keyValueMap = {key: value};
    fileContents.addAll(keyValueMap);
    String jsonString = jsonEncode(fileContents);
    file.writeAsStringSync(jsonString);
  }

  /// Puts data from file into a [Map].
  Future<Map<String, dynamic>> readFromJsonFile() async {
    File file = await _jsonFile;
    log.d('Reading file contents...');
    String rawData = file.readAsStringSync();
    Map<String, dynamic> fileContents;
    if (rawData.isNotEmpty) {
      log.d('Decoding file...');
      fileContents = jsonDecode(rawData);
      log.d(fileContents.toString());
      return fileContents;
    } else {
      log.e('File is empty');
      return {};
    }
  }

  /// Returns a [Future] of a list that contains all the keys in the file.
  Future<List<dynamic>> getFileKeys() async {
    log.d('getting keys...');
    var fileContents = await readFromJsonFile();
    return fileContents.keys.toList();
  }

  /// Returns a [Future] of a list that contains all the values in the file.
  Future<List<dynamic>> getFileValues() async {
    log.d('getting values...');
    var fileContents = await readFromJsonFile();
    return fileContents.values.toList();
  }
}
