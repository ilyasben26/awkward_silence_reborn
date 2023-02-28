import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/prompts.dart';

class PromptCard extends StatelessWidget {
  final String prompt;
  PromptCard(this.prompt);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        prompt,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
