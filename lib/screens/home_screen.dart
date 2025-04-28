import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/github_provider.dart';
import '../widgets/repo_card.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Explorer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<GithubProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.repositories.isEmpty) {
            return const Center(child: Text('No repositories found'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: provider.repositories.length,
            itemBuilder: (context, index) {
              return RepoCard(repo: provider.repositories[index]);
            },
          );
        },
      ),
    );
  }
}
