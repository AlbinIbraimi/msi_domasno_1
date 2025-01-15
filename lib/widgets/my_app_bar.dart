import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: const Text(
        "181171",
      ),
      // actions: [
      //   if (authProvider.showSignIn == false)
      //     IconButton(
      //       icon: const Icon(Icons.login),
      //       onPressed: () {
      //         authProvider.toggleSignIn();
      //       },
      //     ),
      //   if (authProvider.user != null)
      //     IconButton(
      //         onPressed: () => {Navigator.pushNamed(context, '/calendar')},
      //         icon: const Icon(Icons.event)),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
