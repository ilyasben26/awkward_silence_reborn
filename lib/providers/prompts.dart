import 'package:flutter/material.dart';
import 'dart:math';

class Prompt {
  String text;
  String category;
  Prompt({required this.text, required this.category});
}

class Prompts with ChangeNotifier {
  final List<Prompt> _prompts = [
    Prompt(
      text:
          "What's something that you've always wanted to try but haven't had the chance to yet?",
      category: "question",
    ),
    Prompt(
      text:
          "If you could have a conversation with your past self, what advice would you give?",
      category: "question",
    ),
  ];

  Prompt _randPrompt = Prompt(text: "", category: 'question');

  List<Prompt> get prompts {
    return [..._prompts];
  }

  Prompt get randPrompt {
    return _randPrompt;
  }

  void setRandPrompt() {
    Prompt oldPrompt = _randPrompt;

    Prompt newPrompt = _prompts[Random().nextInt(_prompts.length)];

    while (oldPrompt.text == newPrompt.text) {
      newPrompt = _prompts[Random().nextInt(_prompts.length)];
    }

    _randPrompt = newPrompt;

    notifyListeners();
  }
}
