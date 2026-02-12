import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DT.bgWhite,
      appBar: AppBar(
        backgroundColor: DT.bgWhite,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: DT.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings, color: DT.textPrimary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DT.s5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _UserProfileSection(),
            const SizedBox(height: DT.s6),

            _MetricsCard(),

            _ActivityList(),
          ],
        ),
      ),
    );
  }
}

class _UserProfileSection extends StatelessWidget {
  const _UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: DT.borderGrey, width: 2),
            boxShadow: [
              BoxShadow(
                color: DT.shadowLight,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: DT.iconLightGrey.withAlpha(76),
                child: const Icon(Icons.person, color: DT.iconGrey, size: 40),
              ),
            ),
          ),
        ),
        const SizedBox(width: DT.s6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sandra Glam',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: DT.textPrimary,
                ),
              ),
              const SizedBox(width: DT.s1),
              Text(
                'Denmark, Copenhagen',
                style: TextStyle(fontSize: 14, color: DT.textSecondary),
              ),
              const SizedBox(width: DT.s3),
              Row(
                children: [
                  Text(
                    'Follow 72',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: DT.textPrimary,
                    ),
                  ),
                  const SizedBox(width: DT.s4),
                  Text(
                    'Followers 162',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: DT.textPrimary,
                    ),
                  ),
                  const SizedBox(width: DT.s4),
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: DT.iconLightGrey.withAlpha(25),
                borderRadius: BorderRadius.circular(DT.s2),
              ),
              child: const Icon(Icons.share, color: DT.iconGrey, size: 18),
            ),
            const SizedBox(height: DT.s2),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: DT.iconLightGrey.withAlpha(25),
                borderRadius: BorderRadius.circular(DT.s2),
              ),
              child: const Icon(Icons.edit, color: DT.iconGrey, size: 18),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricsCard extends StatelessWidget {
  const _MetricsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _MetricCard(
            color: DT.metricGreen,
            title: 'Start weight',
            value: '53.3 kg',
          ),
        ),
        const SizedBox(width: DT.s3),
        Expanded(
          child: _MetricCard(
            color: DT.metricBlue,
            title: 'Goal',
            value: '50.0  kg',
          ),
        ),
        const SizedBox(width: DT.s3),
        Expanded(
          child: _MetricCard(
            color: DT.metricOrange,
            title: 'Daily calories',
            value: '740 kcal',
          ),
        ),
        const SizedBox(width: DT.s3),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const _MetricCard({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DT.s2),
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(DT.rCardSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: DT.textSecondary),
          ),
          const SizedBox(height: DT.s1),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: DT.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityList extends StatelessWidget {
  const _ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ActivityItem(
          icon: Icons.directions_run,
          title: 'Physical Activity',
          subtitle: '2 days ago',
          ontap: () {},
        ),
        _ActivityItem(
          icon: Icons.assessment,
          title: 'Statistics',
          subtitle: '109 kilo/year',
          ontap: () {},
        ),
        _ActivityItem(
          icon: Icons.route,
          title: 'Routes',
          subtitle: '7',
          ontap: () {},
        ),
        _ActivityItem(
          icon: Icons.flash_on,
          title: 'Equipment',
          subtitle: 'Nike pegasus 3000',
          ontap: () {},
        ),
        _ActivityItem(
          icon: Icons.emoji_events,
          title: 'Best time',
          subtitle: 'Show all',
          ontap: () {},
        ),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback ontap;

  const _ActivityItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: DT.s4),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: DT.borderLight, width: 1)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: DT.iconLightGrey.withAlpha(25),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(icon, color: DT.iconGrey, size: 20),
            ),
            const SizedBox(width: DT.s4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: DT.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: DT.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: DT.textGrey, size: 14),
          ],
        ),
      ),
    );
  }
}
