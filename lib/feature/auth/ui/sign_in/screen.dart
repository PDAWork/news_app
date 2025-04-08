// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:news_app/core/utils/extensions/context_x.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
          'Авторизация',
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
            // Поле для email
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

            // Поле для пароля
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

            // Кнопка "Войти"
            ElevatedButton(
              onPressed: () {
                // Логика входа
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Войти',
                style: textStyle.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Ссылка на регистрацию
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Еще нет аккаунта? ',
                  style: textStyle.bodySmall?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushReplacement('/');
                  },
                  child: Text(
                    'Зарегистрироваться',
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
