import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/widgets/responsive_wrapper.dart';

class QuickActionsScreen extends StatelessWidget {
  const QuickActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsiveWrapper(
      child: Scaffold(
        backgroundColor: AppTheme.lightBackground,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: const Text('Quick Actions'),
          backgroundColor: AppTheme.lightSurface,
          foregroundColor: AppTheme.lightOnSurface,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppConstants.defaultPadding,
                  mainAxisSpacing: AppConstants.defaultPadding,
                  children: [
                    _buildActionCard(
                      context,
                      icon: Icons.swap_horiz,
                      iconColor: Colors.blue,
                      title: 'Buy/Sell',
                      subtitle: 'Trade stocks',
                      onTap: () {
                        context.push('/trading/buy-sell');
                      },
                    ),
                    _buildActionCard(
                      context,
                      icon: Icons.calculate,
                      iconColor: Colors.green,
                      title: 'SIP Calculator',
                      subtitle: 'Plan your investments',
                      onTap: () {
                        // TODO: Navigate to SIP calculator
                      },
                    ),
                    _buildActionCard(
                      context,
                      icon: Icons.school,
                      iconColor: Colors.purple,
                      title: 'Learn Trading',
                      subtitle: 'Interactive courses',
                      onTap: () {
                        // TODO: Navigate to trading courses
                      },
                    ),
                    _buildActionCard(
                      context,
                      icon: Icons.shield,
                      iconColor: Colors.orange,
                      title: 'Risk Assessment',
                      subtitle: 'Know your profile',
                      onTap: () {
                        // TODO: Navigate to risk assessment
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius:
                      BorderRadius.circular(AppConstants.defaultRadius),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 32,
                ),
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppConstants.smallPadding),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
