import 'package:flutter/material.dart';
import 'package:tumbuh_iman/presentation/components/states/error_view.dart';

class NoConnectionView extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoConnectionView({
    super.key,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorView(
      message: 'No internet connection.\nPlease check your network settings.',
      onRetry: onRetry,
      icon: Icons.wifi_off,
    );
  }
}