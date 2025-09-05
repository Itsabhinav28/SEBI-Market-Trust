import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/professional_app_bar.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: ProfessionalAppBar(
        title: 'Profile',
        showBackButton: false,
        customLeading: Builder(
          builder: (context) => Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.chat_bubble_outline,
                  color: AppColors.primaryDark),
              onPressed: () => context.push('/chat'),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildProfileStats(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildProfileOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 40,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: AppColors.primaryDark,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Asha Sharma',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'asha@sebimarkettrust.com',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: AppColors.lightGradient,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Premium Member',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.lightGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.trending_up,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(height: 12),
                const Text(
                  '₹2,18,000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Total Investment',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: AppConstants.defaultPadding),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.lightGradient,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 32,
                ),
                const SizedBox(height: 12),
                const Text(
                  '₹2,45,670',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Current Value',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Column(
      children: [
        _buildCompactOptionTile(
          context,
          'Account Settings',
          Icons.settings,
          const LinearGradient(
            colors: [AppColors.success, AppColors.success],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          () {
            // TODO: Navigate to account settings
          },
        ),
        const SizedBox(height: 8),
        _buildCompactOptionTile(
          context,
          'Investment Goals',
          Icons.flag,
          const LinearGradient(
            colors: [AppColors.primaryMedium, AppColors.primaryDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          () {
            context.push('/goals');
          },
        ),
        const SizedBox(height: 8),
        _buildCompactOptionTile(
          context,
          'Transaction History',
          Icons.history,
          const LinearGradient(
            colors: [AppColors.primaryLight, AppColors.primaryMedium],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          () {
            // TODO: Navigate to transaction history
          },
        ),
        const SizedBox(height: 8),
        _buildCompactOptionTile(
          context,
          'Help & Support',
          Icons.help_outline,
          const LinearGradient(
            colors: [AppColors.warning, AppColors.warning],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          () {
            // TODO: Navigate to help & support
          },
        ),
        const SizedBox(height: 8),
        _buildCompactOptionTile(
          context,
          'Settings',
          Icons.settings_outlined,
          const LinearGradient(
            colors: [AppColors.primaryDark, AppColors.primaryDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          () {
            // TODO: Navigate to settings
          },
        ),
        const SizedBox(height: 8),
        _buildCompactOptionTile(
          context,
          'About',
          Icons.info_outline,
          const LinearGradient(
            colors: [AppColors.primaryLight, AppColors.primaryMedium],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          () {
            // TODO: Navigate to about
          },
        ),
        const SizedBox(height: 8),
        _buildCompactOptionTile(
          context,
          'Log out',
          Icons.logout,
          const LinearGradient(
            colors: [AppColors.error, AppColors.error],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          () {
            // TODO: Implement logout functionality
          },
        ),
      ],
    );
  }

  Widget _buildOptionTile(
    BuildContext context,
    String title,
    IconData icon,
    LinearGradient gradient,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
      ),
    );
  }

  Widget _buildCompactOptionTile(
    BuildContext context,
    String title,
    IconData icon,
    LinearGradient gradient,
    VoidCallback onTap,
  ) {
    return Container(
      height: 50, // Compact height
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12), // Smaller radius
        boxShadow: [
          BoxShadow(
            color: gradient.colors.first.withValues(alpha: 0.2),
            blurRadius: 8, // Smaller blur
            offset: const Offset(0, 4), // Smaller offset
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16, // Smaller horizontal padding
              vertical: 8, // Smaller vertical padding
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8), // Smaller icon padding
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8), // Smaller radius
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 18, // Smaller icon size
                  ),
                ),
                const SizedBox(width: 12), // Smaller spacing
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14, // Smaller font size
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withValues(alpha: 0.8),
                  size: 16, // Smaller arrow size
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
