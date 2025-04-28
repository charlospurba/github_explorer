import 'package:flutter/material.dart';
import '../models/repository.dart';

class RepoDetailScreen extends StatelessWidget {
  final Repository repo;

  const RepoDetailScreen({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description: ${repo.description}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text('Stars: ${repo.stars}', style: const TextStyle(fontSize: 16)),
            Text('Forks: ${repo.forks}', style: const TextStyle(fontSize: 16)),
            Text(
              'Language: ${repo.language}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
