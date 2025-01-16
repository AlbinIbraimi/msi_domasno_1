import 'package:domasna_1/providers/auth_provider.dart';
import 'package:domasna_1/screens/authenticate/authenticate_screen.dart';
import 'package:domasna_1/screens/home/home_wrapper.dart';
import 'package:domasna_1/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthServiceProvider>();

    return Scaffold(
      appBar: authService.user == null ? null : MyAppBar(),
      body:
          authService.user == null ? const Authenticate() : const HomeWrapper(),
    );
  }
}
