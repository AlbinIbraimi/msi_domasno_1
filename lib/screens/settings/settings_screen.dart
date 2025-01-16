import 'package:domasna_1/providers/auth_provider.dart';
import 'package:domasna_1/widgets/Buttons/default_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServiceProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Account Info",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Email:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    authService.user?.email ?? "N/A",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Created On:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    authService.user?.created ?? "N/A",
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [
                  DefaultButton(
                    onPressed: () async {
                      await authService.signout();
                    },
                    text: "Sign Out",
                  ),
                  SizedBox(height: 16),
                  DangerButton(
                    onPressed: () async {
                      await authService.deleteAccount();
                    },
                    text: "Delete Account",
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
