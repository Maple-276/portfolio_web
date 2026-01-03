import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/widgets/nav_bar.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../Service/presentation/screens/service_screen.dart';
import '../../../../features/Projects/presentation/screens/projects_screen.dart';
import '../../../Contact/presentation/screens/contact_screen.dart';
import 'home_screen.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  // Keys para identificar la posición de cada sección
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey(); // Placeholder
  final GlobalKey _contactKey = GlobalKey(); // Placeholder

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      final isScrolled = _scrollController.offset > 50;
      if (isScrolled != _isScrolled) {
        setState(() {
          _isScrolled = isScrolled;
        });
      }
    }
  }

  void _scrollToSection(int index) {
    GlobalKey key;
    switch (index) {
      case 0:
        key = _homeKey;
        break;
      case 1:
        key = _servicesKey;
        break;
      case 2:
        key = _projectsKey;
        break;
      case 3:
        key = _contactKey;
        break;
      default:
        key = _homeKey;
    }

    // Asegurarse de que el widget está renderizado
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      endDrawer: Drawer(
        backgroundColor: AppColors.darkBackground.withValues(alpha: 0.95),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Text(
              'Menu',
              style: Theme.of(
                context,
              ).textTheme.displaySmall?.copyWith(color: AppColors.primaryTeal),
            ),
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.design_services, color: Colors.white),
              title: const Text(
                'Services',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.work, color: Colors.white),
              title: const Text(
                'Projects',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(2);
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail, color: Colors.white),
              title: const Text(
                'Contact',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(3);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // 1. Ambient Glows (Fondo Atmosférico)
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryTeal.withValues(alpha: 0.08),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -150,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withValues(
                  alpha: 0.05,
                ), // Un toque sutil de azul para contraste
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

          // 2. Main Content
          Column(
            children: [
              NavBar(
                onScrollToSection: _scrollToSection,
                isScrolled: _isScrolled,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HomeScreen(key: _homeKey),
                      ServiceScreen(key: _servicesKey),
                      ProjectsScreen(key: _projectsKey),
                      ContactScreen(key: _contactKey),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
