import 'package:flutter/material.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String _text;
  String message;

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

  final myController = TextEditingController();

  void _callWatsonAssistant() async {
    watsonAssistantResponse =
        await watsonAssistant.sendMessage(message, watsonAssistantContext);
    setState(() {
      _text = watsonAssistantResponse.resultText;
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(child: null),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                _text != null ? _text : 'Watson Response Here',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _callWatsonAssistant();
        },
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
