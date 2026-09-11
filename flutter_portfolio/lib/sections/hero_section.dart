import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  const HeroSection({super.key, required this.onViewWork, required this.onContact});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      constraints: BoxConstraints(minHeight: mobile ? 620 : 680),
      width: double.infinity,
      child: Stack(
        children: [
          const Positioned.fill(child: _HeroGlow()),
          Center(
            child: RiseIn(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 68, 20, 70),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const BrandMark(),
                      const SizedBox(height: 23),
                      Text(PortfolioData.eyebrow, style: AppTheme.eyebrow()),
                      const SizedBox(height: 16),
                      Text.rich(
                        const TextSpan(
                          text: PortfolioData.roleTitle,
                          children: [
                            TextSpan(
                              text: PortfolioData.roleAccent,
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: AppTheme.heading1().copyWith(fontSize: mobile ? 39 : 48),
                      ),
                      const SizedBox(height: 18),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 650),
                        child: Text(
                          PortfolioData.heroCopy,
                          textAlign: TextAlign.center,
                          style: AppTheme.body(size: mobile ? 14 : 16),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          FilledButton(onPressed: onViewWork, child: const Text('View my work')),
                          OutlinedButton(onPressed: onContact, child: const Text('Get in touch')),
                        ],
                      ),
                      const SizedBox(height: 38),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: mobile ? 10 : 24,
                        runSpacing: 10,
                        children: [
                          for (var i = 0; i < PortfolioData.metrics.length; i++) ...[
                            if (i > 0)
                              Container(
                                width: 3,
                                height: 3,
                                decoration: const BoxDecoration(
                                  color: AppColors.border,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            Text(
                              '${PortfolioData.metrics[i][0]} ${PortfolioData.metrics[i][1]}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.mutedForeground,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroGlow extends StatelessWidget {
  const _HeroGlow();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          _blob(const Alignment(-0.64, -0.64), AppColors.cyan.withValues(alpha: .17)),
          _blob(const Alignment(0.4, -0.9), AppColors.primary.withValues(alpha: .15)),
        ],
      ),
    );
  }

  Widget _blob(Alignment alignment, Color color) => Align(
        alignment: alignment,
        child: Container(
          width: 520,
          height: 380,
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
            shape: BoxShape.circle,
          ),
        ),
      );
}
