import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/github_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'GitHub Explorer',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter GitHub Personal Access Token',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final token = controller.text.trim();
                if (token.isNotEmpty) {
                  Provider.of<AuthProvider>(context, listen: false)
                      .setToken(token);
                  Provider.of<GithubProvider>(context, listen: false)
                      .fetchUserData(token);
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
