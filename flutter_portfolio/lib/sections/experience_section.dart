import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return SectionShell(
      tinted: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionLabel('EXPERIENCE'),
          const SizedBox(height: 14),
          const SectionHeading(plain: "Where I've ", accent: 'built'),
          SizedBox(height: mobile ? 35 : 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Column(
              children: [
                for (var i = 0; i < PortfolioData.experience.length; i++)
                  _JobRow(
                    job: PortfolioData.experience[i],
                    index: i + 1,
                    last: i == PortfolioData.experience.length - 1,
                    mobile: mobile,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _JobRow extends StatelessWidget {
  final Job job;
  final int index;
  final bool last;
  final bool mobile;
  const _JobRow({
    required this.job,
    required this.index,
    required this.last,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    final details = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (mobile) ...[_year(), const SizedBox(height: 4)],
        Text(job.role, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        Text(
          job.company,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.mutedForeground,
          ),
        ),
        const SizedBox(height: 12),
        for (final p in job.points) BulletLine(p, dotSize: 4),
      ],
    );

    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(bottom: last ? 0 : 52),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 34,
              child: Column(
                children: [
                  Container(
                    width: 33,
                    height: 33,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Text(
                      '$index',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  if (!last) const Expanded(child: VerticalDivider(width: 1, thickness: 1)),
                ],
              ),
            ),
            SizedBox(width: mobile ? 16 : 22),
            if (!mobile) ...[
              SizedBox(width: 150, child: Padding(padding: const EdgeInsets.only(top: 8), child: _year())),
              const SizedBox(width: 22),
            ],
            Expanded(child: details),
          ],
        ),
      ),
    );
  }

  Widget _year() => Text(
        job.year,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      );
}
