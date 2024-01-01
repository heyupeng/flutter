import 'dart:async';
import 'dart:convert';

/// transform Stream<List<int>> to String
Future<String> streamToString1(Stream<List<int>> stream) {
  // var content = '';
  // var lines = utf8.decoder.bind(stream).transform(const LineSplitter());
  // return lines.forEach((element) { content += element;}).then((value) => content);
  return utf8.decoder.bind(stream)
    .transform(const LineSplitter())
    .fold("", (previous, element) => previous + element );
}

Future<String> streamToString2(Stream<List<int>> stream) {
  // return 
  // stream.forEach((element) { 
  //   print('12: ${element} ');
  //  })
  //  .then((value) {
   
  // var content = '';
  // var data = await utf8.decoder.bind(stream).toList();
  // content = data[0];
  // return content;
  return utf8.decoder.bind(stream).toList()
    .then((list) => list.join(','));
  //  });
}
Future<String> streamToString3(Stream<List<int>> stream) {
  return utf8.decodeStream(stream);
}

extension IntListStreamConevrtable on Stream<List<int>> {
  Future<String> toJsonString() {
    return streamToString2(this);
  }
}