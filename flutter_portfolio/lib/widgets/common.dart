import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

bool isMobile(BuildContext context) =>
    MediaQuery.sizeOf(context).width < AppTheme.mobileBreakpoint;

/// The diagonal brand mark (two rotated bars on a gradient tile).
class BrandMark extends StatelessWidget {
  final bool small;
  const BrandMark({super.key, this.small = false});

  @override
  Widget build(BuildContext context) {
    final size = small ? 25.0 : 58.0;
    final s = size / 58;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(small ? 5 : 15),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.navy],
        ),
        boxShadow: small ? null : const [AppColors.shadow],
      ),
      child: Stack(
        children: [
          _bar(left: 14 * s, top: 20 * s, width: 30 * s, height: 9 * s, color: AppColors.cyan),
          _bar(left: 25 * s, top: 31 * s, width: 23 * s, height: 9 * s, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _bar({
    required double left,
    required double top,
    required double width,
    required double height,
    required Color color,
  }) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: -0.785398, // -45deg
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}

class Wordmark extends StatelessWidget {
  final VoidCallback? onTap;
  const Wordmark({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BrandMark(small: true),
          const SizedBox(width: 10),
          Text.rich(
            const TextSpan(
              text: 'Ahmer',
              children: [TextSpan(text: '.dev', style: TextStyle(color: AppColors.primary))],
            ),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(text, style: AppTheme.eyebrow());
}

/// "Selected work" style heading where the last word is tinted.
class SectionHeading extends StatelessWidget {
  final String plain;
  final String accent;
  const SectionHeading({super.key, required this.plain, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: plain,
        children: [TextSpan(text: accent, style: const TextStyle(color: AppColors.primary))],
      ),
      style: AppTheme.heading2().copyWith(fontSize: isMobile(context) ? 29 : 34),
    );
  }
}

class TagChip extends StatelessWidget {
  final String label;
  const TagChip(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.mutedForeground,
        ),
      ),
    );
  }
}

class BulletLine extends StatelessWidget {
  final String text;
  final double dotSize;
  const BulletLine(this.text, {super.key, this.dotSize = 5});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 7, right: 11 - (dotSize - 5)),
            width: dotSize,
            height: dotSize,
            decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          ),
          Expanded(
            child: Text(text, style: AppTheme.body(size: 13)),
          ),
        ],
      ),
    );
  }
}

/// Centers section content and clamps it to the site's 1040px measure.
class SectionShell extends StatelessWidget {
  final Widget child;
  final bool tinted;
  final EdgeInsets? padding;
  const SectionShell({super.key, required this.child, this.tinted = false, this.padding});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: tinted ? AppColors.surface : Colors.transparent,
        border: tinted
            ? const Border.symmetric(horizontal: BorderSide(color: AppColors.border))
            : null,
      ),
      padding: padding ?? EdgeInsets.symmetric(vertical: mobile ? 70 : 95),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Fade + rise entrance animation, matching the web `rise` keyframes.
class RiseIn extends StatefulWidget {
  final Widget child;
  final Duration delay;
  const RiseIn({super.key, required this.child, this.delay = Duration.zero});

  @override
  State<RiseIn> createState() => _RiseInState();
}

class _RiseInState extends State<RiseIn> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 700));

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curve = CurvedAnimation(parent: _c, curve: Curves.easeOut);
    return FadeTransition(
      opacity: curve,
      child: SlideTransition(
        position: Tween(begin: const Offset(0, 0.05), end: Offset.zero).animate(curve),
        child: widget.child,
      ),
    );
  }
}

/// Card that lifts and gains a shadow on hover, like the CSS cards.
class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final double radius;
  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(28),
    this.radius = 12,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(0, _hover ? -4 : 0, 0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(
              color: _hover && widget.onTap != null
                  ? AppColors.primary.withValues(alpha: .45)
                  : AppColors.border,
            ),
            boxShadow: _hover ? const [AppColors.shadow] : null,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
