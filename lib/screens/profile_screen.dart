import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/github_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GithubProvider>(context).user;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body:
          user == null
              ? const Center(child: Text('No user data'))
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username: ${user.username}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Name: ${user.name}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Bio: ${user.bio}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Followers: ${user.followers}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Following: ${user.following}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
    );
  }
}
