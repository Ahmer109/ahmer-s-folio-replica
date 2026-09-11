import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('ABOUT'),
        const SizedBox(height: 18),
        Text(
          PortfolioData.aboutCopy,
          style: AppTheme.body(size: 17, color: AppColors.foreground),
        ),
      ],
    );

    final card = HoverCard(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
      radius: 14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('What I bring',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          for (final item in PortfolioData.whatIBring) BulletLine(item),
        ],
      ),
    );

    return SectionShell(
      padding: EdgeInsets.fromLTRB(0, mobile ? 25 : 30, 0, mobile ? 70 : 95),
      child: mobile
          ? Column(children: [left, const SizedBox(height: 38), card])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 115, child: left),
                const SizedBox(width: 74),
                Expanded(flex: 95, child: card),
              ],
            ),
    );
  }
}
