import 'package:flutter/material.dart';
import '../../../../features/Home/presentation/screens/Home_screen.dart';
import '../../../../features/Service/presentation/screens/Service_screen.dart';
import '../../../../features/Projects/presentation/screens/Projects_screen.dart';
import '../../../../features/Contact/presentation/screens/Contact_screen.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Alexander Portfolio'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HomeScreen(),
            ServiceScreen(),
            ProjectsScreen(),
            ContactScreen(),
          ],
        ),
      ),
    );
  }
}
