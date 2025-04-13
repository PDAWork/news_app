// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:news_app/core/utils/extensions/context_x.dart';
import 'package:news_app/feature/auth/ui/bloc/user_authentication_bloc.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.state,
    required this.onTap,
    required this.textButton,
    super.key,
  });

  final UserAuthenticationState state;
  final VoidCallback onTap;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return switch (state) {
      Loading() => const Center(
          child: CircularProgressIndicator(),
        ),
      _ => ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            textButton,
            style: textStyle.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
    };
  }
}
