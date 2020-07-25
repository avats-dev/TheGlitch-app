import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

class Speak extends StatefulWidget {
  @override
  _SpeakState createState() => _SpeakState();
}

class _SpeakState extends State<Speak> {
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String resultText;

  @override
  void initState() {
    _speechRecognition = SpeechRecognition();

    _speechRecognition.setAvailabilityHandler(
      (bool result) => setState(() => _isAvailable = result),
    );
    _speechRecognition.setRecognitionStartedHandler(
      () => setState(() => _isListening = true),
    );
    _speechRecognition.setRecognitionResultHandler(
      (String speech) => setState(() => resultText = speech),
    );
    _speechRecognition.setRecognitionCompleteHandler(
      () => setState(() => _isListening = false),
    );
    _speechRecognition.activate().then(
          (result) => setState(() => _isAvailable = result),
        );
  }

  Future listen() async {
    if (_isAvailable && !_isListening)
      await _speechRecognition.listen(locale: "en_IN");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
