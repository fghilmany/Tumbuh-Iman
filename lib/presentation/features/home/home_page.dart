import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tumbuh_iman/di/injection.dart';
import 'package:tumbuh_iman/presentation/components/navigation/bottom_nav_bar.dart';
import 'package:tumbuh_iman/presentation/features/home/bloc/home_bloc.dart';
import 'package:tumbuh_iman/presentation/features/home/bloc/home_event.dart';
import 'package:tumbuh_iman/presentation/features/home/bloc/home_state.dart';
import 'package:tumbuh_iman/presentation/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  static final List<Widget> _pages = [
    const _HomeTab(),
    const _ExploreTab(),
    const _ProfileTab(),
  ];

  static final List<BottomNavItem> _navItems = [
    BottomNavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    BottomNavItem(
      icon: Icons.explore_outlined,
      activeIcon: Icons.explore,
      label: 'Explore',
    ),
    BottomNavItem(
      icon: Icons.person_outline,
      activeIcon: Icons.person,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: _pages[state.currentTabIndex],
          bottomNavigationBar: BottomNavBar(
            currentIndex: state.currentTabIndex,
            onTap: (index) {
              context.read<HomeBloc>().add(HomeTabChanged(index));
            },
            items: _navItems,
          ),
        );
      },
    );
  }
}

// Home Tab
class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
      ),
      body: const Center(
        child: Text('Home Content'),
      ),
    );
  }
}

// Explore Tab
class _ExploreTab extends StatelessWidget {
  const _ExploreTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
      ),
      body: const Center(
        child: Text('Explore Content'),
      ),
    );
  }
}

// Profile Tab
class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
      ),
      body: const Center(
        child: Text('Profile Content'),
      ),
    );
  }
}
