import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoadingIndicator extends HookWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    Animation<Color?>? valueColor;
    final animationController =
        useAnimationController(duration: const Duration(seconds: 2));
    final colorTween = ColorTween(
      begin: Theme.of(context).colorScheme.primary,
      end: Theme.of(context).colorScheme.secondary,
    );
    useEffect(() {
      animationController.repeat(reverse: true);
      return null;
    }, const []);
    useEffect(() {
      valueColor = animationController.drive(colorTween);
      return null;
    }, [colorTween]);
    return LinearProgressIndicator(
      minHeight: 8.0,
      valueColor: valueColor,
    );
  }
}
