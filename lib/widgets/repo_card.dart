import 'package:flutter/material.dart';
import '../models/repository.dart';
import '../screens/repo_detail_screen.dart';

class RepoCard extends StatelessWidget {
  final Repository repo;

  const RepoCard({Key? key, required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          repo.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(repo.description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('⭐ ${repo.stars}'),
            Text('🍴 ${repo.forks}'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RepoDetailScreen(repo: repo)),
          );
        },
      ),
    );
  }
}