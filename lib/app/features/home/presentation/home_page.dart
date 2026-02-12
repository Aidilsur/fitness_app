import 'package:fitness_app/app/design/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selected = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DT.bg,
      appBar: AppBar(
        backgroundColor: DT.bg,
        elevation: 0,
        toolbarHeight: 100,
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: DT.bgWhite, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: DT.shadowMedium,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  'src',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: DT.iconLightGrey.withAlpha(76),
                    child: const Icon(Icons.person, color: DT.iconGrey),
                  ),
                ),
              ),
            ),
            const SizedBox(width: DT.s4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hello, Aidil',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: DT.textPrimary,
                    ),
                  ),
                  const SizedBox(height: DT.s1),
                  Text(
                    'Today ${DateFormat('d MM.').format(DateTime.now())}',
                    style: TextStyle(fontSize: 14, color: DT.textSecondary),
                  ),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: DT.bgWhite,
                borderRadius: BorderRadius.circular(DT.rCardSmall),
                boxShadow: [
                  BoxShadow(
                    color: DT.shadowLight,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.search, color: DT.iconGrey, size: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DT.s5),
        child: Column(
          children: [
            // Daily challange card
            _DailyChallangeCard(),
            const SizedBox(height: DT.s6),
            // Weekly List Component
            _WeeklyListComponent(
              selectedDate: _selected,
              onDateSelected: (date) => setState(() {
                _selected = date;
              }),
            ),
            const SizedBox(height: DT.s6),
            // Year Plan Section
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(
                    child: _PlanCard(
                      color: DT.cardYellow,
                      difficulty: 'Medium',
                      title: 'Yoga Group',
                      date: '25 Nov',
                      time: '14:00-15:00',
                      room: 'AS room',
                      trainer: 'Tiffany Way',
                      trainerImage:
                          'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      isLeft: true,
                      onTap: () => context.go('/session-detail'),
                    ),
                  ),
                  SizedBox(width: DT.s4),
                  Expanded(
                    child: _PlanCard(
                      color: DT.cardBlue,
                      difficulty: 'Light',
                      title: 'Balance',
                      date: '20 Nov',
                      time: '18:00-19:30',
                      room: 'A2 room',
                      trainer: 'Tiffany Way',
                      trainerImage:
                          'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      isLeft: false,
                      onTap: () => context.go('/session-detail'),
                    ),
                  ),
                ],
              ),
            ),
            // Social Media Card
            const SizedBox(height: DT.s4),
            _SocialMediaCard(),
            const SizedBox(height: DT.s4),
          ],
        ),
      ),
    );
  }
}

class _DailyChallangeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DT.s5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [DT.challangeGradientStart, DT.challangeGradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(DT.rCard),
        boxShadow: [
          BoxShadow(
            color: DT.shadowLight,
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daily Challange',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: DT.textPrimary,
                  ),
                ),
                const SizedBox(height: DT.s2),
                const Text(
                  'Do your plan before 09:00 AM',
                  style: TextStyle(fontSize: 14, color: DT.textSecondary),
                ),
                const SizedBox(height: DT.s2),
                Row(
                  children: [
                    _UserChip(
                      imageUrl:
                          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                    Transform.translate(
                      offset: const Offset(-8, 0),
                      child: _UserChip(
                        imageUrl:
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-16, 0),
                      child: _UserChip(
                        imageUrl:
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-24, 0),
                      child: _UserChip(
                        imageUrl:
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-32, 0),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: DT.bgWhite,
                          shape: BoxShape.circle,
                          border: Border.all(color: DT.bgWhite, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '+4',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: DT.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserChip extends StatelessWidget {
  final String imageUrl;
  const _UserChip({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: DT.bgWhite, width: 2),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: DT.iconLightGrey.withAlpha(76),
            child: const Icon(Icons.person, size: 16, color: DT.iconGrey),
          ),
        ),
      ),
    );
  }
}

class _WeeklyListComponent extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  const _WeeklyListComponent({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday + 1));

    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date = startOfWeek.add(Duration(days: index));
          final isSelected =
              date.day == selectedDate.day &&
              date.month == selectedDate.month &&
              date.year == selectedDate.year;

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Container(
              width: 50,
              margin: const EdgeInsets.only(right: DT.s3),
              decoration: BoxDecoration(
                color: isSelected ? DT.bgBlack : DT.bgWhite,
                borderRadius: BorderRadius.circular(DT.rCardSmall),
                boxShadow: [
                  BoxShadow(
                    color: DT.shadowMedium,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(date),
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? DT.textwhite : DT.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    DateFormat('d').format(date),
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? DT.textwhite : DT.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final Color color;
  final String difficulty;
  final String title;
  final String date;
  final String time;
  final String room;
  final String trainer;
  final String trainerImage;
  final bool isLeft;
  final VoidCallback onTap;

  const _PlanCard({
    super.key,
    required this.color,
    required this.difficulty,
    required this.title,
    required this.date,
    required this.time,
    required this.room,
    required this.trainer,
    required this.trainerImage,
    required this.isLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(DT.s4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(DT.rChip),
          boxShadow: [
            BoxShadow(
              color: DT.shadowMedium,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: DT.s2,
                vertical: DT.s1,
              ),
              decoration: BoxDecoration(
                color: DT.bgWhite.withAlpha(76),
                borderRadius: BorderRadius.circular(DT.s2),
              ),
              child: Text(
                difficulty,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: DT.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: DT.s3),
            Text(date, style: TextStyle(fontSize: 12, color: DT.textSecondary)),
            Text(time, style: TextStyle(fontSize: 12, color: DT.textSecondary)),
            Text(room, style: TextStyle(fontSize: 12, color: DT.textSecondary)),
            const Spacer(),
            Row(
              children: [
                if (isLeft) ...[
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(trainerImage),
                  ),
                  const SizedBox(width: DT.s2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trainer',
                        style: TextStyle(fontSize: 10, color: DT.textSecondary),
                      ),
                      Text(
                        trainer,
                        style: TextStyle(
                          fontSize: 12,
                          color: DT.textPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: DT.iconLightGrey.withAlpha(76),
                      borderRadius: BorderRadius.circular(DT.s2),
                    ),
                    child: const Icon(
                      Icons.extension,
                      color: DT.iconGrey,
                      size: 20,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialMediaCard extends StatelessWidget {
  const _SocialMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SocialIcon(icon: Icons.camera_alt, color: DT.socialPink),
          _SocialIcon(icon: Icons.play_circle_outline, color: DT.socialRed),
          _SocialIcon(icon: Icons.chat_bubble_outline, color: DT.socialBlue),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _SocialIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: DT.bgWhite,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: DT.shadowMedium,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
