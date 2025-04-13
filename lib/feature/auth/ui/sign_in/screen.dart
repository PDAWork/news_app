// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/bloc/authentication_bloc.dart';

// Project imports:
import 'package:news_app/core/utils/route_wrapper.dart';
import 'package:news_app/di/app_depends.dart';
import 'package:news_app/feature/auth/ui/bloc/user_authentication_bloc.dart';
import 'package:news_app/feature/auth/ui/widget/action_text.dart';
import 'package:news_app/feature/auth/ui/widget/app_bar_auth.dart';
import 'package:news_app/feature/auth/ui/widget/auth_button.dart';
import 'package:news_app/navigation/app_router.dart';

class SignInScreen extends StatefulWidget implements RouteWrapper {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();

  @override
  Widget wrappedRoute(AppDepends depends) {
    return BlocProvider(
      create: (context) => depends.userAuthenticationBloc,
      child: this,
    );
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarAuth(
        title: 'Авторизация',
      ),
      body: BlocListener<UserAuthenticationBloc, UserAuthenticationState>(
        listenWhen: (prev, current) => prev.isLoading && current.isSuccess,
        listener: (context, state) {
          context.push(AppPath.home.name);
          context.read<AuthenticationBloc>().add(const AuthenticationEvent.login());
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
                TextFormField(
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
                              UserAuthenticationEvent.signIn(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      },
                      textButton: 'Войти',
                    );
                  },
                ),
                ActionText(
                  text: 'Еще нет аккаунта? ',
                  actionText: 'Зарегистрироваться',
                  onTap: () {
                    context.pushReplacement(AppPath.signUp.name);
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
