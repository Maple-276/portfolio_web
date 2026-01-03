import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth > 800;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        // Color verde que se hace más sólido al hacer scroll
        color: _isScrolled
            ? AppColors.primaryTeal
            : AppColors.primaryTeal.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: _isScrolled
                ? Colors.black.withOpacity(0.1)
                : Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        boxShadow: _isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 60 : 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo Area
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logo_header.webp',
                  height: 35,
                  fit: BoxFit.contain,
                  cacheWidth: 100,
                ),
                const SizedBox(width: 12),
                Text(
                  'Alexander P.',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 0.5,
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 1),
                        blurRadius: 2,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Navigation Links (Desktop)
            if (isDesktop)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _NavBarItem(title: 'Home'),
                  _NavBarItem(title: 'Services'),
                  _NavBarItem(title: 'Projects'),
                  _NavBarItem(title: 'Contact'),
                ],
              )
            else
              IconButton(
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                  size: 28,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  // TODO: Implementar Drawer
                },
              ),
          ],
        ),
      ),
    );
  }
}

/// Widget privado para cada item de navegación
class _NavBarItem extends StatefulWidget {
  final String title;
  const _NavBarItem({required this.title});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.only(left: 35),
        child: TextButton(
          onPressed: () {
            // TODO: Implementar scroll
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: _isHovered ? Colors.black : Colors.black87,
                  fontSize: 16,
                  fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              // Línea de acento al hacer hover
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _isHovered ? 20 : 0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
