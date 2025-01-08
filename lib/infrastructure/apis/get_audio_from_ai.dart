import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiMethods {
  static Future<String> getTextFromAI({required String text, required String userDetail, required String userName}) async {
    //"You are Arjuna from the Mahabharata. Respond to the following message as Arjuna would talk..User's message: $text"
    final response = await http.post(
      Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyCTQ0O4Zsm0Ul4nT93YYHIda3CHZfDXmb0'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": "You are $userName from $userDetail. Respond to the following message as $userName would talk..User's message: $text"}
            ]
          }
        ]
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body)['candidates'][0]['content']['parts'][0]['text'];
    } else {
      throw Exception('Failed to generate audio');
    }
  }

  static Future<String> getAudioFromAI(String text) async {
    const url = 'https://api.openai.com/v1/audio/speech';
    const apiKey =
        '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';

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
