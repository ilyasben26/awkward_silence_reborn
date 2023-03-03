import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../providers/prompts.dart';

class PromptCard extends StatefulWidget {
  final String prompt;
  final AnimationController controller;
  PromptCard({required this.prompt, required this.controller});

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Animate(
        controller: widget.controller,
        effects: const [
          /*BlurEffect(
              duration: Duration(seconds: 1),
              begin: Offset(10, 10),
              curve: Curves.easeIn),*/
          ScaleEffect(
              begin: Offset(0.8, 0.8),
              curve: Curves.easeIn,
              duration: Duration(seconds: 1)),
          BlurEffect(
              duration: Duration(seconds: 1),
              begin: Offset(10, 10),
              curve: Curves.easeIn),
          FadeEffect(duration: Duration(seconds: 1), curve: Curves.easeIn)
        ],
        child: Text(
          widget.prompt,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
