// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:news_app/core/utils/extensions/context_x.dart';
import 'package:news_app/core/utils/route_wrapper.dart';
import 'package:news_app/di/app_depends.dart';
import 'package:news_app/feature/auth/ui/bloc/user_authentication_bloc.dart';
import 'package:news_app/feature/auth/ui/widget/action_text.dart';
import 'package:news_app/feature/auth/ui/widget/app_bar_auth.dart';
import 'package:news_app/feature/auth/ui/widget/auth_button.dart';
import 'package:news_app/navigation/app_router.dart';

class SignUpScreen extends StatefulWidget implements RouteWrapper {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();

  @override
  Widget wrappedRoute(AppDepends depends) {
    return BlocProvider<UserAuthenticationBloc>(
      create: (BuildContext context) => depends.userAuthenticationBloc,
      child: this,
    );
  }
}

class _SignInScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;

    return Scaffold(
      appBar: const AppBarAuth(
        title: 'Регистрация',
      ),
      body: BlocListener<UserAuthenticationBloc, UserAuthenticationState>(
        listenWhen: (prev, current) => prev.isLoading && current.isSuccess,
        listener: (context, state) {
          context.pushReplacement(AppPath.home.name);
        },
        child: BlocListener<UserAuthenticationBloc, UserAuthenticationState>(
          listenWhen: (prev, current) => prev.isLoading && current.isError,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ошибка'),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                BlocBuilder<UserAuthenticationBloc, UserAuthenticationState>(
                  builder: (context, state) {
                    return AuthButton(
                      state: state,
                      onTap: () {
                        context.read<UserAuthenticationBloc>().add(
                              UserAuthenticationEvent.signUp(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      },
                      textButton: 'Создать аккаунт',
                    );
                  },
                ),
                ActionText(
                  text: 'Уже есть аккаунт? ',
                  actionText: 'Войти',
                  onTap: () {
                    context.pushReplacement(AppPath.signIn.name);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
