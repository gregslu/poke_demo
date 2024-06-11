import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    this.skipError = false,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;

  @override
  Widget build(BuildContext context) {
    return value.when(
        skipLoadingOnReload: skipLoadingOnReload,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipError: skipError,
        data: data,
        error: (e, st) => Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ErrorMessageWidget(error: e),
            )),
        loading: () => const SizedBox.shrink());
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    this.skipError = false,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;

  @override
  Widget build(BuildContext context) {
    return value.when(
        skipLoadingOnReload: skipLoadingOnReload,
        skipLoadingOnRefresh: skipLoadingOnRefresh,
        skipError: skipError,
        data: data,
        error: (e, st) => Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ErrorMessageWidget(error: e),
            )),
        loading: () => const SizedBox.shrink());
  }
}
