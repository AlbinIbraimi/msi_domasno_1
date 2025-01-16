import 'package:domasna_1/providers/auth_provider.dart';
import 'package:domasna_1/widgets/Buttons/default_buttons.dart';
import 'package:domasna_1/widgets/Inputs/email_input.dart';
import 'package:domasna_1/widgets/Inputs/password_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  register(AuthServiceProvider authService) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPas = _confirmPasswordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty && confirmPas.isNotEmpty) {
      if (password != confirmPas) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Confirm password does not match.')),
        );
      } else {
        final user = await authService.registerWithEmailAndPassword(
            email, password, confirmPas);
        if (user == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registraion failed')),
          );
        }
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
                image: AssetImage('assets/registerBackground.jpg'),
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
                    const SizedBox(height: 16),
                    PasswordInputField(
                      controller: _confirmPasswordController,
                      placeholder: "Confirm password",
                    ),
                    const SizedBox(height: 32),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultButton(
                            onPressed: () async {
                              await register(authService);
                            },
                            text: "Register"),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () => {
                            authService.toggleSignIn()
                          }, // Trigger the custom action on tap
                          child: Text(
                            "Already have an account? Continue to login",
                            style: TextStyle(
                              color: Colors
                                  .blue, // Color to make it look like a link
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
