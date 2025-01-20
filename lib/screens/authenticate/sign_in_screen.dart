import 'package:domasna_1/providers/auth_provider.dart';
import 'package:domasna_1/widgets/buttons/default_buttons.dart';
import 'package:domasna_1/widgets/inputs/email_input.dart';
import 'package:domasna_1/widgets/inputs/password_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  signIn(AuthServiceProvider authService) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      final user = await authService.signInWithEmailPassword(
        email,
        password,
      );

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Failed!')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServiceProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/loginBackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EmailInputField(controller: _emailController),
                    const SizedBox(height: 16),
                    PasswordInputField(controller: _passwordController),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                            onPressed: () async {
                              await signIn(authService);
                            },
                            text: "Login"),
                        const SizedBox(width: 10),
                        DefaultButton(
                            onPressed: () => {authService.toggleSignIn()},
                            text: "Register")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
