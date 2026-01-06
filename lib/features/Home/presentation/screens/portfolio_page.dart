import 'package:flutter/material.dart';
import '../../../../core/widgets/nav_bar.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../service/presentation/screens/service_screen.dart';
import '../../../../features/projects/presentation/screens/projects_screen.dart';
import '../../../contact/presentation/screens/contact_screen.dart';
import '../widgets/ambient_background.dart';
import '../widgets/mobile_drawer.dart';
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
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

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
      endDrawer: MobileDrawer(onScrollToSection: _scrollToSection),
      body: Stack(
        children: [
          // 1. Ambient Glows (Fondo Atmosférico)
          const AmbientBackground(),

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
