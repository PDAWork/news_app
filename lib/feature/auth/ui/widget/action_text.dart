// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:news_app/core/utils/extensions/context_x.dart';

class ActionText extends StatelessWidget {
  const ActionText({
    required this.text,
    required this.actionText,
    required this.onTap,
    super.key,
  });

  final String text;
  final String actionText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textStyle.bodySmall?.copyWith(
            color: Colors.grey[700],
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            actionText,
            style: textStyle.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
