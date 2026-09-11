import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return SectionShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('PROJECTS'),
          const SizedBox(height: 14),
          const SectionHeading(plain: 'Selected ', accent: 'work'),
          SizedBox(height: mobile ? 35 : 48),
          LayoutBuilder(
            builder: (context, constraints) {
              const gap = 18.0;
              final columns = mobile ? 1 : 2;
              final width = (constraints.maxWidth - gap * (columns - 1)) / columns;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final p in PortfolioData.projects)
                    SizedBox(width: width, child: _ProjectCard(project: p, compact: mobile)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final bool compact;
  const _ProjectCard({required this.project, required this.compact});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      onTap: () => openUrl(project.href),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                project.number,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              const Icon(Icons.arrow_outward, size: 18, color: AppColors.primary),
            ],
          ),
          const SizedBox(height: 24),
          Text(project.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 11),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: compact ? 0 : 66),
            child: Text(project.body, style: AppTheme.body(size: 13)),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final t in project.tags) TagChip(t)],
          ),
        ],
      ),
    );
  }
}
