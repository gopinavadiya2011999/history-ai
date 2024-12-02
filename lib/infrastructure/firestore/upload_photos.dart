import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

class UploadFilesFirestore {
  static Future<String> uploadFile(File file, String storagePath) async {
    try {
      List<int> imageBytes = await file.readAsBytes();
      img.Image? image = img.decodeImage(Uint8List.fromList(imageBytes));

      List<int> compressedBytes = img.encodeJpg(image!, quality: 80);

      File compressedImage = File('${file.parent.path}/${file.path.split("/").last}')..writeAsBytesSync(compressedBytes);
      Reference storageReference = FirebaseStorage.instance.ref().child(storagePath);
      UploadTask uploadTask = storageReference.putFile(compressedImage);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        debugPrint('Upload is $progress% complete.');
      }, onError: (e) {
        debugPrint('Upload error: $e');
      });

      TaskSnapshot taskSnapshot = await uploadTask;
      if (taskSnapshot.state == TaskState.success) {
        String downloadURL = await taskSnapshot.ref.getDownloadURL();
        debugPrint('Compressed Image uploaded successfully. Download URL: $downloadURL');
        return downloadURL;
      } else {
        debugPrint('Upload failed. TaskState: ${taskSnapshot.state}');
        return '';
      }
    } catch (e) {
      if (e is FirebaseException) {
        debugPrint('FirebaseException: ${e.code}, ${e.message}');
      } else {
        debugPrint('Unknown error: $e');
      }
      return '';
    }
  }
}
