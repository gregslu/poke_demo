import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // Animation<Color?>? valueColor;
    // final animationController =
    //     useAnimationController(duration: const Duration(seconds: 2));
    // final colorTween = ColorTween(
    //   begin: Theme.of(context).colorScheme.primary,
    //   end: Theme.of(context).colorScheme.secondary,
    // );
    // useEffect(() {
    //   animationController.repeat(reverse: true);
    //   return null;
    // }, const []);
    // useEffect(() {
    //   valueColor = animationController.drive(colorTween);
    //   return null;
    // }, [colorTween]);
    return LinearProgressIndicator(
        // minHeight: 6.0,
        // year2023: false,
        // valueColor: valueColor,
        // color: Theme.of(context).colorScheme.primary,
        // backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        );
  }
}
