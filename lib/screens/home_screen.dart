import 'package:awkward_silence_reborn/providers/prompts.dart';
import 'package:awkward_silence_reborn/widgets/prompt_card.dart';
import 'package:awkward_silence_reborn/widgets/reset_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  bool _isInit = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize the controller and animation
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Prompts>(context).setPromptsFromJson().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Dispose the controller when not needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promptData = Provider.of<Prompts>(context);

    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            PromptCard(
              prompt: promptData.randPrompt.text,
              controller: _controller,
            ),
            const Spacer(),
            _isLoading
                ? SizedBox.shrink()
                : ResetButton(controller: _controller),
          ],
        )),
      ),
    );
  }
}
