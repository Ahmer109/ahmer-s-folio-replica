import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final list = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final skill in PortfolioData.skills) _SkillBar(skill: skill),
      ],
    );

    final toolbox = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(PortfolioData.toolboxCopy, style: AppTheme.body()),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final t in PortfolioData.tools) TagChip(t)],
        ),
      ],
    );

    return SectionShell(
      tinted: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('SKILLS'),
          const SizedBox(height: 14),
          const SectionHeading(plain: 'One stack, ', accent: 'full range'),
          SizedBox(height: mobile ? 35 : 48),
          if (mobile)
            Column(children: [list, const SizedBox(height: 38), toolbox])
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: list),
                const SizedBox(width: 90),
                Expanded(child: toolbox),
              ],
            ),
        ],
      ),
    );
  }
}

class _SkillBar extends StatelessWidget {
  final Skill skill;
  const _SkillBar({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  skill.name,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                '${skill.percent}%',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: skill.percent / 100),
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOut,
                    builder: (context, value, _) => Container(
                      width: constraints.maxWidth * value,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.cyan],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
