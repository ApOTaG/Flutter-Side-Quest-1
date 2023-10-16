import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Word Counter'),
        ),
        body: WordCounterWidget(),
      ),
    );
  }
}

class WordCounterWidget extends StatefulWidget {
  @override
  _WordCounterWidgetState createState() => _WordCounterWidgetState();
}

class _WordCounterWidgetState extends State<WordCounterWidget> {
  TextEditingController _textController = TextEditingController();
  int _wordCount = 0;

  void _updateWordCount() {
    String text = _textController.text;
    List<String> words = text.split(' ');
    setState(() {
      _wordCount = words.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _textController,
            maxLines: 5,
            decoration: InputDecoration(labelText: 'Enter your text'),
            onChanged: (value) {
              _updateWordCount();
            },
          ),
          SizedBox(height: 20),
          Text('Word Count: $_wordCount'),
        ],
      ),
    );
  }
}
