import 'package:flutter/material.dart';
import 'dart:math';

class Prompts with ChangeNotifier {
  final List<String> _prompts = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi lobortis.',
    'What\'s 9 + 10?',
    'A very long question, hopefully it turns out right!',
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
