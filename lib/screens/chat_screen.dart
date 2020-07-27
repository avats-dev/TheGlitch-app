import 'package:chat_bot/constants.dart';
import 'package:chat_bot/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:chat_bot/models/chat_data.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';
import 'package:speech_recognition/speech_recognition.dart';

/*
 *format code into 3 files later 
 * before deployment
 */

class ChatScreen extends StatefulWidget {
  static String id = 'chat_sreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatList chatData = ChatList();

  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;

  var _controller = TextEditingController();
  bool change = false;
  // String message;
  String resultText;

  WatsonAssistantV2Credential credential = WatsonAssistantV2Credential(
    version: '2020-04-01',
    username: 'apikey',
    apikey: 'jKzP6qjLQg48mlERQwb6bSXsxigua8S5wZogEsIFNHhK',
    assistantID: 'fa0bb7fa-a3b1-4d29-81b2-ba7fa2e70eab',
    url:
        'https://api.eu-gb.assistant.watson.cloud.ibm.com/instances/0f1a51ae-8838-4c10-b0de-b14bdcabdcdc/v2',
  );

  WatsonAssistantApiV2 watsonAssistant;
  WatsonAssistantResponse watsonAssistantResponse;
  WatsonAssistantContext watsonAssistantContext =
      WatsonAssistantContext(context: {});

  void _callWatsonAssistant() async {
    watsonAssistantResponse =
        await watsonAssistant.sendMessage(resultText, watsonAssistantContext);
    setState(() {
      String text = watsonAssistantResponse.resultText;
      chatData.addChat(text, false);
    });
    watsonAssistantContext = watsonAssistantResponse.context;
  }

  @override
  void initState() {
    super.initState();
    watsonAssistant =
        WatsonAssistantApiV2(watsonAssistantCredential: credential);
    _callWatsonAssistant();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future listen() async {
    if (_isAvailable && !_isListening)
      await _speechRecognition.listen(locale: "en_IN");
  }

  void init() {
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

  void messageChange(String value) {
    setState(() {
      resultText = value;
      change = value == "" ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        backgroundColor: kBcolor,
        title: Text('COV - Buddy'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(child: AllChat(chatList: chatData.chatList)),
            Container(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                      decoration: BoxDecoration(
                        color: kBcolor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          messageChange(value);
                        },
                        decoration: kTextFieldDecoration,
                      ),
                    ),
                  ),
                  MyButton(
                    icon: change ? Icons.send : Icons.mic,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (change) {
                        print(resultText);
                        _controller.clear();
                        setState(() {
                          change = false;
                          chatData.addChat(resultText, true);
                          _callWatsonAssistant();
                        });
                      } else {
                        init();
                        bool shouldUpdate = await showDialog(
                          context: this.context,
                          child: AlertDialog(
                            backgroundColor: kBcolor,
                            content: Text('Tap the Mic'),
                            actions: <Widget>[
                              FlatButton(
                                child: Icon(Icons.mic),
                                onPressed: () {
                                  if (_isAvailable && !_isListening)
                                    _speechRecognition
                                        .listen(locale: "en_IN")
                                        .then((result) => print('$result'));
                                },
                              ),
                              FlatButton(
                                child: Icon(Icons.check),
                                onPressed: () => Navigator.pop(context, true),
                              ),
                            ],
                          ),
                        );
                        setState(() {
                          if (shouldUpdate && resultText != null) {
                            chatData.addChat(resultText, true);
                            _callWatsonAssistant();
                          }
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
