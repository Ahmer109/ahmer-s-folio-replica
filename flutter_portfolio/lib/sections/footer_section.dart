import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onHome;
  const FooterSection({super.key, required this.onHome});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    const notes = ['Designed & built with care.', '© 2026 Ahmer Ali'];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
            child: mobile
                ? Column(
                    children: [
                      Wordmark(onTap: onHome),
                      const SizedBox(height: 8),
                      for (final n in notes) Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(n, style: _noteStyle),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wordmark(onTap: onHome),
                      for (final n in notes) Text(n, style: _noteStyle),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  static const _noteStyle = TextStyle(fontSize: 11, color: AppColors.mutedForeground);
}
