import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_color.dart';
import 'package:my_portfolio/core/constants/font_size_manager.dart';

// ─── Data model ────────────────────────────────────────────────────────────────

class ExperienceEntry {
  final String company;
  final String role;
  final String duration;
  final String category;
  final Color accentColor;
  final IconData icon;
  final List<String> bullets;

  const ExperienceEntry({
    required this.company,
    required this.role,
    required this.duration,
    required this.category,
    required this.accentColor,
    required this.icon,
    required this.bullets,
  });
}

// ─── Static data ───────────────────────────────────────────────────────────────

final List<ExperienceEntry> professionalExperiences = [
   const ExperienceEntry(
    company: 'GodaDev',
    role: 'Junior Flutter Developer',
    duration: '~2 – 2.5 years',
    category: 'Flutter',
    accentColor: Color(0xFF56CFE1),
    icon: Icons.code_rounded,
    bullets: [
      'Developed cross-platform mobile apps (Android & iOS) with Flutter & Dart.',
      'Implemented BLoC/Cubit state management throughout the project lifecycle.',
      'Integrated RESTful APIs and managed backend communication.',
      'Worked with Firebase and third-party services.',
      'Built reusable, maintainable Flutter widgets and components.',
      'Debugged UI, API, performance, and integration issues.',
      'Used Git & GitHub for version control and team collaboration.',
      'Participated in development, testing, and production releases.',
    ],
  ),
  
  const ExperienceEntry(
    company: 'Safaria',
    role: 'Mid-Level Flutter Developer',
    duration: 'Current  ·  ~10 months',
    category: 'Flutter',
    accentColor: Color(0xFFFFAF29),
    icon: Icons.flight_takeoff_rounded,
    bullets: [
      'Develop & maintain cross-platform apps (Android, iOS, Web) with Flutter & Dart.',
      'Worked on Traveller App and Agency App.',
      'Implemented BLoC/Cubit state-management patterns at scale.',
      'Integrated REST APIs with Dio — robust communication & error handling.',
      'Worked with Firebase & Supabase for backend services and data management.',
      'Implemented caching & performance optimisations for network data and images.',
      'Built Arabic & English localisation (multi-language support).',
      'Integrated Apple In-App Purchases (iOS) and payment solutions (Android/Web).',
      'CI/CD pipeline with GitHub Actions, Fastlane, and Shorebird.',
      'Handled App Store & Google Play deployment and production issues.',
      'Collaborated with backend, UI/UX, and cross-functional teams.',
    ],
  ),
 
  const ExperienceEntry(
    company: 'Additional Backend Experience',
    role: 'Backend Developer — ASP.NET Core',
    duration: '~6 months',
    category: 'Backend',
    accentColor: Color(0xFFB993D6),
    icon: Icons.storage_rounded,
    bullets: [
      'Developed RESTful APIs with ASP.NET Core and C#.',
      'Worked with Entity Framework Core and SQL Server.',
      'Applied Clean Architecture principles.',
      'Implemented CQRS pattern and AutoMapper.',
      'Designed database entities and relationships.',
      'Implemented authentication, authorisation, and business logic.',
      'Managed migrations and database operations with EF Core.',
    ],
  ),
];

// ─── Main section widget ────────────────────────────────────────────────────────

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.bgLight1,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          // ── Section heading ──
          _SectionHeading(),
          const SizedBox(height: 48),
          // ── Timeline cards ──
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                for (int i = 0; i < professionalExperiences.length; i++)
                  _ExperienceCard(
                    entry: professionalExperiences[i],
                    isFirst: i == 0,
                    isLast: i == professionalExperiences.length - 1,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Section heading ────────────────────────────────────────────────────────────

class _SectionHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Professional Experience',
          style: TextStyle(
            fontSize: FontSizeManager.f24,
            fontWeight: FontWeight.bold,
            color: AppColor.whitePrimary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 60,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFFAF29), Color(0xFF56CFE1)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'A timeline of roles and contributions across mobile & backend engineering.',
          style: TextStyle(
            fontSize: FontSizeManager.f12,
            color: AppColor.whiteSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

// ─── Timeline card ──────────────────────────────────────────────────────────────

class _ExperienceCard extends StatefulWidget {
  final ExperienceEntry entry;
  final bool isFirst;
  final bool isLast;

  const _ExperienceCard({
    required this.entry,
    required this.isFirst,
    required this.isLast,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;
  bool _expanded = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0.0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    final delay = widget.isFirst ? 0 : widget.isLast ? 400 : 200;
    Future.delayed(Duration(milliseconds: delay), () {
      if (mounted) _ctrl.forward();
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color accent = widget.entry.accentColor;

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        // Wrap in Column so the bottom connector is drawn OUTSIDE the Row.
        // This means row height == card content height (no inflated layout).
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Spine: top connector + dot only, no bottom line ──
                SizedBox(
                  width: 42,
                  child: Column(
                    children: [
                      if (!widget.isFirst)
                        Container(
                          width: 2,
                          height: 21,
                          color: accent.withValues(alpha: 0.3),
                        ),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: accent.withValues(alpha: 0.15),
                          border: Border.all(color: accent, width: 2),
                        ),
                        child: Icon(widget.entry.icon, color: accent, size: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // ── Card body — grows freely, no height constraint ──
                Expanded(
                  child: _CardBody(
                    entry: widget.entry,
                    expanded: _expanded,
                    onToggle: () => setState(() => _expanded = !_expanded),
                  ),
                ),
              ],
            ),
            // ── Bottom connector drawn AFTER the row so it never affects
            //    the row's height. Sits in the 20px gap between cards. ──
            if (!widget.isLast)
              Row(
                children: [
                  // Offset to centre the 2px line under the 42px dot (x = 20)
                  const SizedBox(width: 20),
                  Container(
                    width: 2,
                    height: 20,
                    color: accent.withValues(alpha: 0.3),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// ─── Card body ─────────────────────────────────────────────────────────────────

class _CardBody extends StatelessWidget {
  final ExperienceEntry entry;
  final bool expanded;
  final VoidCallback onToggle;

  const _CardBody({
    required this.entry,
    required this.expanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: AppColor.bgLight2,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: expanded
                  ? entry.accentColor
                  : entry.accentColor.withValues(alpha: 0.25),
              width: expanded ? 1.5 : 1,
            ),
            boxShadow: expanded
                ? [
                    BoxShadow(
                      color: entry.accentColor.withValues(alpha: 0.12),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header row ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Category badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: entry.accentColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              entry.category,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: entry.accentColor,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Company name
                          Text(
                            entry.company,
                            style: const TextStyle(
                              fontSize: FontSizeManager.f16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.whitePrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          // Role title
                          Text(
                            entry.role,
                            style: TextStyle(
                              fontSize: FontSizeManager.f12,
                              color: entry.accentColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Duration chip
                    _DurationChip(
                        duration: entry.duration, color: entry.accentColor),
                  ],
                ),
                const SizedBox(height: 12),
                // ── Expand toggle row ──
                Row(
                  children: [
                    Text(
                      expanded ? 'Hide details' : 'Show details',
                      style: TextStyle(
                        fontSize: 11,
                        color: entry.accentColor.withValues(alpha: 0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 16,
                        color: entry.accentColor.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                // ── Expandable bullets ──
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 350),
                  crossFadeState: expanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: entry.accentColor.withValues(alpha: 0.2),
                          thickness: 1,
                          height: 1,
                        ),
                        const SizedBox(height: 14),
                        for (final bullet in entry.bullets)
                          _BulletRow(text: bullet, color: entry.accentColor),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Duration chip ─────────────────────────────────────────────────────────────

class _DurationChip extends StatelessWidget {
  final String duration;
  final Color color;

  const _DurationChip({required this.duration, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.schedule_rounded, size: 11, color: color),
          const SizedBox(width: 5),
          Text(
            duration,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Bullet row ────────────────────────────────────────────────────────────────

class _BulletRow extends StatelessWidget {
  final String text;
  final Color color;

  const _BulletRow({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: FontSizeManager.f12,
                color: AppColor.whiteSecondary,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
