import 'package:flutter/material.dart';

enum FeedbackType { network, server, general }

class FeedbackMessage extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onRetry;
  final FeedbackType type;

  const FeedbackMessage({
    super.key,
    required this.title,
    required this.message,
    required this.onRetry,
    this.type = FeedbackType.general,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Container
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? Colors.white.withValues(alpha: 0.05)
                    : Colors.grey.withValues(alpha: 0.1),
              ),
              child: Icon(
                _getIconForType(type),
                size: 48,
                color: isDark ? Colors.grey[400] : Colors.grey[400],
              ),
            ),
            const SizedBox(height: 32),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                // Automatically adapts to dark/light via Theme, but ensuring contrast
              ),
            ),
            const SizedBox(height: 16),
            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            // Retry Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF5856D6,
                  ), // Purple from design
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 8,
                  shadowColor: const Color(0xFF5856D6).withValues(alpha: 0.4),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Retry',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForType(FeedbackType type) {
    switch (type) {
      case FeedbackType.network:
        return Icons.wifi_off_rounded;
      case FeedbackType.server:
        return Icons.cloud_off_rounded;
      case FeedbackType.general:
        return Icons.error_outline_rounded;
    }
  }
}
