import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'add_flashcard_page.dart';
import 'flashcard_model.dart';
import 'ques_ans.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    
  int _curIndexNum = 0;

  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF1E3A8A);
    final accentColor = const Color(0xFF14B8A6);
    final surfaceColor = const Color(0xFFF8FAFC);

    return Scaffold(
        backgroundColor: surfaceColor,
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Flashcards Learning App",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
            backgroundColor: themeColor,
            toolbarHeight: 72,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    
                SizedBox(
                  width: 300,
                  height: 300,
                  child: FlipCard(
                      direction: FlipDirection.HORIZONTAL,
                      front:
                          FlashCardWidget(text: qaList[_curIndexNum].question),
                      back:
                          FlashCardWidget(text: qaList[_curIndexNum].answer))),
              
              Text("Tap to view Answer",
                  style: TextStyle(
                    fontSize: 15,
                    color: themeColor,
                    fontWeight: FontWeight.w500,
                  )),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                    
                  ElevatedButton.icon(
                      onPressed: () {
                        showPreviousCard();
                      },
                      icon: Icon(
                        Icons.arrow_left,
                        size: 30,
                        color: Color(0xFFE4E4E4),
                      ),
                      label: Text(""),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.only(
                              right: 20, left: 25, top: 15, bottom: 15))),
                  
                  ElevatedButton.icon(
                      onPressed: () {
                        showNextCard();
                      },
                      icon: Icon(
                        Icons.arrow_right,
                        size: 30,
                        color: Color(0xFFE4E4E4),
                      ),
                      label: Text(""),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.only(
                              right: 20, left: 25, top: 15, bottom: 15)))
                ],
              ),
              SizedBox(height: 15),
              
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddFlashcardPage()));
                  },
                  child: const Text(
                    "Add FlashCard",
                    style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: accentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.only(
                          right: 20, left: 25, top: 15, bottom: 15))),
            ])));
  }

  void showNextCard() {
    setState(() {
      _curIndexNum = (_curIndexNum + 1 < qaList.length) ? _curIndexNum + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _curIndexNum =
          (_curIndexNum - 1 >= 0) ? _curIndexNum - 1 : qaList.length - 1;
    });
  }
}