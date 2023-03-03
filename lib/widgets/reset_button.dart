import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../providers/prompts.dart';

class ResetButton extends StatefulWidget {
  final AnimationController controller;
  const ResetButton({super.key, required this.controller});

  @override
  _ResetButtonState createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  bool _isLoading = false;
  double scale = 1;
  double turns = 0;
  bool isLong = false;
  @override
  void dispose() {
    // Dispose the controller when not needed
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 150),
      child: AnimatedScale(
        scale: scale,
        duration: Duration(seconds: 1),
        child: GestureDetector(
          onTapDown: _isLoading
              ? null
              : (details) {
                  setState(() {
                    scale = 1.3;
                  });
                },
          onTapCancel: _isLoading
              ? null
              : () {
                  setState(() {
                    scale = 1;
                  });
                },
          onTapUp: _isLoading
              ? null
              : (details) {
                  setState(() {
                    scale = 1;
                  });
                },
          onPanEnd: _isLoading
              ? null
              : (_) {
                  setState(() {
                    scale = 1;
                  });
                },
          onTap: _isLoading
              ? null
              : () {
                  setState(() {
                    _isLoading = !_isLoading;

                    scale = 1.3;
                    turns += 1;
                  });

                  widget.controller.reverse().then((value) {
                    setState(() {
                      scale = 1;
                      turns += 1;
                    });
                    Provider.of<Prompts>(context, listen: false)
                        .setRandPrompt();
                    widget.controller.forward().then((value) => setState(() {
                          _isLoading = !_isLoading;
                          scale = 1;
                        }));
                  });
                },
          child: GlassmorphicContainer(
            height: 100,
            width: 100,
            borderRadius: 200,
            blur: 6.5,
            shape: BoxShape.circle,
            border: 2,
            linearGradient: LinearGradient(
              colors: [
                Color(0xFFffffff).withOpacity(0.5),
                Color(0xFFFFFFFF).withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderGradient: LinearGradient(
              colors: [
                Color(0xFFffffff).withOpacity(0.5),
                Color(0xFFFFFFFF).withOpacity(0.01),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // decoration: const BoxDecoration(
            //     color: Colors.white, shape: BoxShape.circle),
            child: AnimatedRotation(
              turns: turns,
              duration: Duration(seconds: 1),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/arrow_circular.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
