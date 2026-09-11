import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class TopBar extends StatefulWidget {
  final void Function(String section) onNavigate;
  const TopBar({super.key, required this.onNavigate});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: .92),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 64,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
                  child: Row(
                    children: [
                      Wordmark(onTap: () => widget.onNavigate('Home')),
                      if (!mobile) ...[
                        const Spacer(),
                        for (final item in PortfolioData.navItems)
                          _NavLink(label: item, onTap: () => widget.onNavigate(item)),
                        const Spacer(),
                        SizedBox(
                          height: 36,
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                            ),
                            onPressed: () => widget.onNavigate('Contact'),
                            child: const Text('Hire me'),
                          ),
                        ),
                      ] else ...[
                        const Spacer(),
                        IconButton(
                          tooltip: 'Toggle navigation',
                          onPressed: () => setState(() => _open = !_open),
                          icon: Icon(_open ? Icons.close : Icons.menu),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (mobile && _open)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 18),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final item in PortfolioData.navItems)
                    InkWell(
                      onTap: () {
                        setState(() => _open = false);
                        widget.onNavigate(item);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(item, style: AppTheme.body(size: 13)),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink({required this.label, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 13,
              color: _hover ? AppColors.primary : AppColors.mutedForeground,
            ),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
