// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:news_app/core/utils/extensions/context_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Регистрация',
          style: textStyle.titleMedium?.copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Имя',
                hintText: 'Введите ваше имя',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Введите ваш email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Пароль',
                hintText: 'Введите ваш пароль',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            // Кнопка "Создать аккаунт"
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Создать аккаунт',
                style: textStyle.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Ссылка на вход
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Уже есть аккаунт? ',
                  style: textStyle.bodySmall?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushReplacement('/sign-in');
                  },
                  child: Text(
                    'Войти',
                    style: textStyle.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
