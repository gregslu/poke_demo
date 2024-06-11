import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({required this.error, super.key});
  final Object error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      error.toString(),
      style: theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.error,
      ),
    );
  }
}
