import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';

import 'package:flutter/services.dart';

class Prompt {
  String text;
  String category;
  Prompt({required this.text, required this.category});

  factory Prompt.fromJson(Map<String, dynamic> json) {
    return Prompt(
      text: json["text"],
      category: json["category"],
    );
  }
}

class Prompts with ChangeNotifier {
  List<Prompt> _prompts = [
    // Prompt(
    //   text:
    //       "What's something that you've always wanted to try but haven't had the chance to yet?",
    //   category: "question",
    // ),
    // Prompt(
    //   text:
    //       "If you could have a conversation with your past self, what advice would you give?",
    //   category: "question",
    // ),
  ];

  Prompt _randPrompt = Prompt(text: "", category: 'question');

  List<Prompt> get prompts {
    return [..._prompts];
  }

  Prompt get randPrompt {
    return _randPrompt;
  }

  Future<void> setPromptsFromJson() async {
    final String response =
        await rootBundle.loadString("assets/json/prompts.json");

    final data = json.decode(response);
    //data["prompts"];

    _prompts = List.generate(
      data["prompts"].length,
      (index) => Prompt(
        text: data["prompts"][index]["text"],
        category: data["prompts"][index]["category"],
      ),
    );
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
