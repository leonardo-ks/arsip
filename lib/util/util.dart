import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

Future<Uint8List?> readFileByte(String filePath) async {
  Uri myUri = Uri.parse(filePath);
  File audioFile = File.fromUri(myUri);
  Uint8List? bytes;
  await audioFile.readAsBytes().then((value) {
    bytes = Uint8List.fromList(value);
  }).catchError((onError) {
    log(onError.toString());
  });
  return bytes;
}