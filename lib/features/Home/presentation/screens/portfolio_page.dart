import 'package:flutter/material.dart';
import '../../../../core/widgets/nav_bar.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../Service/presentation/screens/Service_screen.dart';
import 'Home_screen.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                // Detección de scroll para futuras mejoras
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    HomeScreen(),
                    ServiceScreen(),
                    // Descomentar cuando implementes estas secciones:
                    // ProjectsScreen(),
                    // ContactScreen(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
