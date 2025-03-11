import 'package:dummy_full_with_clean/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../manager/auth_provider.dart';
import '../manager/auth_state.dart';


class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  void _login() {
    final authState = ref.watch(authNotifierProvider);
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username.isNotEmpty && password.isNotEmpty) {
      ref.read(authNotifierProvider.notifier).singIn(username, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next is AuthSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AutofillGroup(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: "Username"),
                autofillHints: const [AutofillHints.username], // Enable autofill
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
                autofillHints: const [AutofillHints.password], // Enable autofill
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); // Hide keyboard
                  _login();
                },
                child: const Text("Sign In"),
              ),
              const SizedBox(height: 20),
              if (authState is AuthLoading) const CircularProgressIndicator(),
              if (authState is AuthError) Text(authState.message, style: const TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}

