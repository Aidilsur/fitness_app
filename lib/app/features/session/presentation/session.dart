import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SessionPage extends StatelessWidget {
  const SessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DT.bg,
        elevation: 0,
        title: Text(
          'Sessions',
          style: TextStyle(
            color: DT.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DT.s5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Avalable Sessions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: DT.textPrimary,
              ),
            ),
            SizedBox(height: DT.s2),
            const Text(
              'Choose your workout session',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: DT.textPrimary,
              ),
            ),
            SizedBox(height: DT.s4),
            _SessionCard(
              title: 'Yoga Group',
              trainer: 'Tiffany Way',
              duration: '45 min',
              difficulty: 'Medium',
              calories: '115kcal',
              description: 'Gentle yinvasa to improve flexibility and balance',
              color: DT.cardYellow,
              onTap: () => context.go('/session-detail'),
            ),
            SizedBox(height: DT.s4),
            _SessionCard(
              title: 'Balance',
              trainer: 'Tiffany Way',
              duration: '30 min',
              difficulty: 'Light',
              calories: '90kcal',
              description: 'Light session to activate core and stabilizers',
              color: DT.cardBlue,
              onTap: () => context.go('/session-detail'),
            ),
            SizedBox(height: DT.s4),
            _SessionCard(
              title: 'Strenth Training',
              trainer: 'Tiffany Way',
              duration: '45 min',
              difficulty: 'Hard',
              calories: '115kcal',
              description: 'Gentle yinvasa to improve flexibility and balance',
              color: DT.cardYellow,
              onTap: () => context.go('/session-detail'),
            ),
            SizedBox(height: DT.s4),
            _SessionCard(
              title: 'Cardio Blast',
              trainer: 'Tiffany Way',
              duration: '45 min',
              difficulty: 'Hard',
              calories: '115kcal',
              description: 'Gentle yinvasa to improve flexibility and balance',
              color: DT.cardYellow,
              onTap: () => context.go('/session-detail'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final String title;
  final String trainer;
  final String duration;
  final String difficulty;
  final String calories;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _SessionCard({
    super.key,
    required this.title,
    required this.trainer,
    required this.duration,
    required this.difficulty,
    required this.calories,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(DT.s5),
        decoration: BoxDecoration(
          color: DT.bgWhite,
          borderRadius: BorderRadius.circular(DT.s5),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 80,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: DT.s4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: DT.textPrimary,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DT.s2,
                          vertical: DT.s1,
                        ),
                        decoration: BoxDecoration(
                          color: _getDifficultyColor(difficulty).withAlpha(25),
                          borderRadius: BorderRadius.circular(DT.s2),
                        ),
                        child: Text(
                          difficulty,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _getDifficultyColor(difficulty),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: DT.s2),
                  Text(
                    'Trainer: $trainer',
                    style: const TextStyle(
                      fontSize: 14,
                      color: DT.textSecondary,
                    ),
                  ),
                  const SizedBox(height: DT.s2),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: DT.textSecondary,
                      height: 1.4,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: DT.s3),
                  Row(
                    children: [
                      _InfoChip(icon: Icons.access_time, text: duration),
                      SizedBox(width: DT.s3),
                      _InfoChip(
                        icon: Icons.local_fire_department,
                        text: calories,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: DT.s4),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withAlpha(25),
                borderRadius: BorderRadius.circular(DT.rChip),
              ),
              child: Icon(Icons.arrow_forward_ios, color: color, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'light':
        return DT.difficultyLight;
      case 'medium':
        return DT.difficultyMedium;
      case 'hard':
        return DT.difficultyHard;
      default:
        return DT.iconGrey;
    }
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: DT.iconGrey),
        const SizedBox(width: DT.s1),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: DT.textSecondary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
