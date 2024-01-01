// ignore_for_file: unused_field

import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileStorage<T extends Object> {
  static final Map <String, String> _applicationDirectoryMap = {};

  FileStorage(this.filename, this.value, this.contents2value, this.value2contents);
  
  bool _hasFile = false;
  bool _isReaded = false;
  late File _file;

  String filename;
  String contents = '';
  
  T Function(String contents) contents2value;
  String Function(T value) value2contents;
  T value;
  
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    if (_hasFile) {
      return _file;
    }
    
    final path = await _localPath;
    File file = File('$path/$filename');
    return file.exists()
      .then((value) {
        if (value == true) { return file; } 
        return file.create(recursive: true).then((value) => value); 
      })
      .then((file) { _hasFile = true; return _file = file as File; 
      })
    ;
  }

  Future<T> read() async {
    if (_isReaded) {
      return value;
    }
    try {
      final file = await _localFile;
      print(file.path);
      // Read the file
      final contents = await file.readAsString();
      _updateContent(contents);
      return value;
    } catch (e) {
      // If encountering an error, return ''
      return value;
    }
  }

  Future<T> write() async {
    contents = value2contents(value);

    return _localFile
    .then((file) => file.writeAsString(contents))
    .then((flile) => this.value);
  }

  // Future<T> append(T appendValue) async {
  //   value = value + appendValue;
  //   return  write();
  // }

  Future<T> save() async { 
    return write();
  }

  String _updateContent(String contents) {
    this.contents = contents;
    _updateValue(contents);
    return this.contents;
  }

  void _updateValue(String content) {
    value = contents2value(contents);
  }

}

class MapFileStorage extends FileStorage<Map<String, dynamic>> {
  
  MapFileStorage(String filename) : 
    super(filename, <String,dynamic>{}, 
    (contents) => json.decode(contents) , 
    (value) => value.toString() //json.encode(value)
  );

  static const String _shareFilePath = '/Shared/map.json';
  static final MapFileStorage _share = MapFileStorage(_shareFilePath);
  static MapFileStorage get share => _share;

  void set({required String key, required String value} ) {
    this.value[key] = value;
  }

  T get<T>({ required String key, required T defaultValue }) {
    var v = value[key];
    return v is T ? v : defaultValue;
  }
} 
