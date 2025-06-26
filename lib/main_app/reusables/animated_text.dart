import 'package:flutter/material.dart';

import 'app_text.dart';

class TypewriterText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Duration duration;
  const TypewriterText({
    super.key,
    this.fontSize,
    this.fontWeight,
    required this.text,
    this.duration = const Duration(milliseconds: 50),
  });

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<int>? typingAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAnimation());
  }

  void _startAnimation() {
    controller?.dispose(); 

    final int charCount = widget.text.length;
    final totalDuration = Duration(milliseconds: widget.duration.inMilliseconds * charCount);

    controller = AnimationController(vsync: this, duration: totalDuration);

    typingAnimation = StepTween(begin: 0, end: charCount).animate(controller!)
      ..addListener(() {
        if (mounted) setState(() {});
      });

    controller!.forward();
  }

  @override
  void didUpdateWidget(TypewriterText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _startAnimation();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int charCount = typingAnimation?.value ?? 0;
    final String displayed = widget.text.substring(0, charCount.clamp(0, widget.text.length));
    return AppText(text: displayed, fontSize: widget.fontSize, fontWeight: widget.fontWeight);
  }
}
