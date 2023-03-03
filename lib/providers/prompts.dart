import 'package:flutter/material.dart';
import 'dart:math';

class Prompt {
  String text;
  String category;
  Prompt({required this.text, required this.category});
}

class Prompts with ChangeNotifier {
  final List<String> _prompts = [
    "What's something that you've always wanted to try but haven't had the chance to yet?",
    "If you could have a conversation with your past self, what advice would you give?",
    "Hey, I couldn't help but notice your [accessory or clothing item]. It looks really cool. Where did you get it?",
    "Hey, I'm on a mission to meet the most interesting people in this room, and I think I just found one. Can I buy you a drink and hear your story?"
  ];

  String _randPrompt = '';

  List<String> get prompts {
    return [..._prompts];
  }

  String get randPrompt {
    return _randPrompt;
  }

  void setRandPrompt() {
    String oldPrompt = _randPrompt;

    String newPrompt = _prompts[Random().nextInt(_prompts.length)];

    while (oldPrompt == newPrompt) {
      newPrompt = _prompts[Random().nextInt(_prompts.length)];
    }

    _randPrompt = newPrompt;

    notifyListeners();
  }
}
