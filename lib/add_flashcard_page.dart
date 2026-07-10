import 'package:flutter/material.dart';
import 'flashcard_model.dart';
import 'ques_ans.dart';


class AddFlashcardPage extends StatefulWidget {
  @override
  _AddFlashcardPageState createState() => _AddFlashcardPageState();
}


class _AddFlashcardPageState extends State<AddFlashcardPage> {
  

  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  
  void _addFlashcard() {
      
    
    if (_questionController.text.isNotEmpty &&
        _answerController.text.isNotEmpty) {
      setState(() {
          
        
        qaList.add(Flashcard(
          question: _questionController.text,
          answer: _answerController.text,
        ));
      });

      _questionController.clear();
      _answerController.clear();

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF1E3A8A);
    final accentColor = const Color(0xFF14B8A6);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("Add a Flashcard"),
        backgroundColor: themeColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Enter Question',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                labelText: 'Enter Answer',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: accentColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _addFlashcard,
              child: Text("Add Flashcard"),
            ),
          ],
        ),
      ),
    );
  }
}