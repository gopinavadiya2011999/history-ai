import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiMethods{

  static Future<String> getTextFromAI(String text) async {
    const url = 'https://api.openai.com/v1/chat/completions';
    const apiKey = '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';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-4o-mini",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": text}
        ]
      }),
    );
    print("response::: ${response.statusCode}");
    print("response::: ${response.body}");
    if (response.statusCode == 200) {
      return '';
    } else {
      throw Exception('Failed to generate audio');
    }
  }

  static  Future<String> getAudioFromAI(String text) async {
    const url = 'https://api.openai.com/v1/audio/speech';
    const apiKey = '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';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'tts-1',
        'input': text,
        'voice': 'alloy',
      }),
    );

    if (response.statusCode == 200) {
      // Get the directory to save the audio file
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      // Define the file path and name
      String filePath = '$tempPath/output_audio.mp3';

      // Save the binary data as an audio file
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print('Audio file saved to $filePath');

      return filePath;
    } else {
      throw Exception('Failed to generate audio');
    }
  }


}