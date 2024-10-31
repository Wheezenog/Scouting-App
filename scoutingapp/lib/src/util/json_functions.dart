import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';

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

  /// Writes [Map] data to a file.
  ///
  /// + [key] The key assigned to the file. NOTE:
  ///   - NOTE: If key already exists within the file, the new value will replace the old one.
  /// + [value] The value assigned to the given key.
  void writeToFile(String key, dynamic value, File file) {
    log.d('writing to file...');
    var fileContents = readFromJsonFile(file);
    var keyValueMap = {key: value};
    fileContents.addAll(keyValueMap);
    String jsonString = jsonEncode(fileContents);
    file.writeAsStringSync(jsonString);
  }

  /// Puts data from file into a [Map].
  ///
  /// + [file] The file to get the data from.
  Map<String, dynamic> readFromJsonFile(File file) {
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
  List<dynamic> getFileKeys(File file) {
    log.d('getting keys...');
    var fileContents = readFromJsonFile(file);
    return fileContents.keys.toList();
  }

  /// Returns a [Future] of a list that contains all the values in the file.
  List<dynamic> getFileValues(File file) {
    log.d('getting values...');
    var fileContents = readFromJsonFile(file);
    return fileContents.values.toList();
  }
}

// NOTE: I don't know if ill need this or not.

// // The getter used for the json file in question.
// Future<File> get _jsonFile async {
//   Directory? dir = await getTemporaryDirectory();
//   dir.createSync();
//   return File('${dir.path}/$fileName');
// }
