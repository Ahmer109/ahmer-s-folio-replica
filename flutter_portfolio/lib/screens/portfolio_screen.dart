import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/top_bar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final _scrollController = ScrollController();
  final _keys = <String, GlobalKey>{
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Experience': GlobalKey(),
    'Contact': GlobalKey(),
  };

  void _scrollTo(String section) {
    final ctx = _keys[section]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      alignment: 0,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBar(onNavigate: _scrollTo),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  KeyedSubtree(
                    key: _keys['Home'],
                    child: HeroSection(
                      onViewWork: () => _scrollTo('Projects'),
                      onContact: () => _scrollTo('Contact'),
                    ),
                  ),
                  KeyedSubtree(key: _keys['About'], child: const AboutSection()),
                  KeyedSubtree(key: _keys['Skills'], child: const SkillsSection()),
                  KeyedSubtree(key: _keys['Projects'], child: const ProjectsSection()),
                  KeyedSubtree(key: _keys['Experience'], child: const ExperienceSection()),
                  KeyedSubtree(key: _keys['Contact'], child: const ContactSection()),
                  FooterSection(onHome: () => _scrollTo('Home')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
