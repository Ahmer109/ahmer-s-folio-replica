import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  bool _sent = false;

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    final left = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('CONTACT'),
        const SizedBox(height: 14),
        const SectionHeading(plain: "Let's build something ", accent: 'great'),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Text(PortfolioData.contactCopy, style: AppTheme.body()),
        ),
        const SizedBox(height: 30),
        _ContactLink(
          icon: Icons.mail_outline,
          label: PortfolioData.email,
          url: 'mailto:${PortfolioData.email}',
        ),
        _ContactLink(
          icon: Icons.phone_outlined,
          label: PortfolioData.phone,
          url: 'tel:+923152661772',
        ),
        const _ContactLink(
          icon: Icons.code,
          label: 'github.com/Ahmer109',
          url: PortfolioData.github,
        ),
        const _ContactLink(
          icon: Icons.business_center_outlined,
          label: 'linkedin.com/in/a-ahmer',
          url: PortfolioData.linkedin,
        ),
      ],
    );

    final form = Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Field(label: 'Name', hint: 'Your name'),
          const SizedBox(height: 17),
          const _Field(label: 'Email', hint: 'you@example.com'),
          const SizedBox(height: 17),
          const _Field(label: 'Message', hint: 'Tell me about your project', lines: 4),
          const SizedBox(height: 17),
          FilledButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                setState(() => _sent = true);
              }
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text('Send message'), SizedBox(width: 8), Icon(Icons.arrow_outward, size: 16)],
            ),
          ),
          if (_sent)
            const Padding(
              padding: EdgeInsets.only(top: 14),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, size: 16, color: AppColors.primary),
                  SizedBox(width: 7),
                  Flexible(
                    child: Text(
                      'Thanks — your message is ready to send.',
                      style: TextStyle(fontSize: 12, color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );

    return SectionShell(
      child: mobile
          ? Column(children: [left, const SizedBox(height: 48), form])
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 115, child: left),
                const SizedBox(width: 74),
                Expanded(flex: 95, child: form),
              ],
            ),
    );
  }
}

class _ContactLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  const _ContactLink({required this.icon, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: InkWell(
        onTap: () => openUrl(url),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: AppColors.primary),
            const SizedBox(width: 10),
            Flexible(child: Text(label, style: AppTheme.body(size: 13))),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final String hint;
  final int lines;
  const _Field({required this.label, required this.hint, this.lines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
        const SizedBox(height: 7),
        TextFormField(
          maxLines: lines,
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
          style: const TextStyle(fontSize: 13),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.card,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            hintStyle: const TextStyle(fontSize: 13, color: AppColors.mutedForeground),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          ),
        ),
      ],
    );
  }
}
