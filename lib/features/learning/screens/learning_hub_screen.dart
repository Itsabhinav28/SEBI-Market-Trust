import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/responsive_wrapper.dart';
import '../../../core/widgets/professional_app_bar.dart';

class LearningHubScreen extends StatelessWidget {
  const LearningHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsiveWrapper(
      child: Scaffold(
        backgroundColor: AppColors.backgroundPrimary,
        appBar: ProfessionalAppBar(
          title: 'Learning Hub',
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
                icon: const Icon(Icons.menu, color: AppColors.primaryDark),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        ),
        drawer: _buildNavigationDrawer(context),
        body: ListView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          children: [
            _buildProgressCard(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildCourseCard(
              context,
              icon: Icons.book,
              iconColor: Colors.blue,
              title: 'Mutual Fund Basics',
              lessons: '5 lessons',
              duration: '45 min',
              status: 'Complete',
              statusColor: Colors.green,
              progress: 1.0,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildCourseCard(
              context,
              icon: Icons.monetization_on,
              iconColor: Colors.purple,
              title: 'Stock Market Trading',
              lessons: '8 lessons',
              duration: '2 hours',
              status: 'In Progress',
              statusColor: Colors.blue,
              progress: 0.375, // 3/8
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildCourseCard(
              context,
              icon: Icons.account_balance,
              iconColor: Colors.orange,
              title: 'Tax Planning & Savings',
              lessons: '6 lessons',
              duration: '90 min',
              status: 'Locked',
              statusColor: Colors.grey,
              progress: 0.0,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildVisualLearningSection(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildScenarioLearningSection(context),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildVirtualTradingCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.purple[400]!,
            Colors.pink[300]!,
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Progress',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    'Current Level: Intermediate',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    '750/1000 XP to Advanced',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 6,
                      ),
                    ),
                    Text(
                      '75%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber[300],
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String lessons,
    required String duration,
    required String status,
    required Color statusColor,
    required double progress,
  }) {
    return Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppConstants.defaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                      ),
                      const SizedBox(height: AppConstants.smallPadding),
                      Text(
                        '$lessons • $duration',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    if (status == 'In Progress')
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '3/8',
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      )
                    else if (status == 'Complete')
                      Icon(
                        Icons.check_circle,
                        color: statusColor,
                        size: 24,
                      )
                    else
                      Icon(
                        Icons.lock,
                        color: statusColor,
                        size: 24,
                      ),
                    const SizedBox(height: AppConstants.smallPadding),
                    Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppConstants.smallPadding),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(statusColor),
              minHeight: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisualLearningSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Visual Learning Hub',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
        ),
        const SizedBox(height: AppConstants.smallPadding),
        Row(
          children: [
            Expanded(
              child: _buildVisualCard(
                context,
                'Market Trends',
                'Interactive charts showing market movements',
                Icons.show_chart,
                Colors.blue,
                '📈',
              ),
            ),
            const SizedBox(width: AppConstants.smallPadding),
            Expanded(
              child: _buildVisualCard(
                context,
                'Risk Analysis',
                'Visual risk assessment tools',
                Icons.analytics,
                Colors.red,
                '📊',
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.smallPadding),
        Row(
          children: [
            Expanded(
              child: _buildVisualCard(
                context,
                'Portfolio Mix',
                'Pie charts for asset allocation',
                Icons.pie_chart,
                Colors.green,
                '🥧',
              ),
            ),
            const SizedBox(width: AppConstants.smallPadding),
            Expanded(
              child: _buildVisualCard(
                context,
                'Learning Path',
                'Progress visualization',
                Icons.timeline,
                Colors.purple,
                '🎯',
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.smallPadding),
        _buildInteractiveChart(context),
      ],
    );
  }

  Widget _buildVisualCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    String emoji,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.smallPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 18,
                ),
              ),
              const SizedBox(width: AppConstants.smallPadding / 2),
              Text(
                emoji,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.smallPadding / 2),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[700],
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveChart(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(AppConstants.smallPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withValues(alpha: 0.1),
            Colors.blue.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        border: Border.all(
          color: Colors.blue.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.show_chart,
                color: Colors.blue,
                size: 20,
              ),
              const SizedBox(width: AppConstants.smallPadding / 2),
              Text(
                'Interactive Market Chart',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Live',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.smallPadding),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.trending_up,
                      color: Colors.green,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Nifty 50: 19,847.25',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+2.3% (+445.50)',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Interactive chart with real-time data',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScenarioLearningSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Scenario-Based Learning',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
        ),
        const SizedBox(height: AppConstants.smallPadding),
        Row(
          children: [
            Expanded(
              child: _buildScenarioCard(
                context,
                'Market Crash',
                'What would you do if the market drops 20%?',
                Icons.trending_down,
                Colors.red,
              ),
            ),
            const SizedBox(width: AppConstants.smallPadding),
            Expanded(
              child: _buildScenarioCard(
                context,
                'Bull Market',
                'How to maximize gains in a rising market?',
                Icons.trending_up,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.smallPadding),
        Row(
          children: [
            Expanded(
              child: _buildScenarioCard(
                context,
                'Inflation',
                'Protecting your portfolio from inflation',
                Icons.monetization_on,
                Colors.orange,
              ),
            ),
            const SizedBox(width: AppConstants.smallPadding),
            Expanded(
              child: _buildScenarioCard(
                context,
                'Retirement',
                'Planning for your golden years',
                Icons.elderly,
                Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildScenarioCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.smallPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withValues(alpha: 0.1), color.withValues(alpha: 0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        border: Border.all(
          color: color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: AppConstants.smallPadding / 2),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.smallPadding / 2),
          Text(
            description,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[700],
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildVirtualTradingCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.green[300]!,
            Colors.blue[300]!,
          ],
        ),
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Virtual Trading',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Text(
                    'Practice with ₹1,00,000 virtual money',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'P&L Today',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '+₹2,450',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: AppConstants.defaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total P&L',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '+₹12,340',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to virtual trading
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[700],
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.defaultPadding,
                  vertical: AppConstants.smallPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.defaultRadius),
                ),
              ),
              child: const Text(
                'Start Trading',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF1D4ED8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF3B82F6),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Asha Sharma',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'asha@sebimarkettrust.com',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            'Dashboard',
            Icons.home,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Portfolio',
            Icons.pie_chart,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Chat',
            Icons.chat,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Learning Hub',
            Icons.school,
            () {
              Navigator.pop(context);
              context.go('/home');
            },
          ),
          _buildDrawerItem(
            context,
            'Smart Alerts',
            Icons.notifications,
            () {
              Navigator.pop(context);
              context.push('/alerts');
            },
          ),
          _buildDrawerItem(
            context,
            'Financial Goals',
            Icons.flag,
            () {
              Navigator.pop(context);
              context.push('/goals');
            },
          ),
          _buildDrawerItem(
            context,
            'Market News',
            Icons.newspaper,
            () {
              Navigator.pop(context);
              context.push('/news');
            },
          ),
          _buildDrawerItem(
            context,
            'My Holdings',
            Icons.account_balance_wallet,
            () {
              Navigator.pop(context);
              context.push('/holdings');
            },
          ),
          _buildDrawerItem(
            context,
            'Buy/Sell',
            Icons.trending_up,
            () {
              Navigator.pop(context);
              context.push('/trading/buy-sell');
            },
          ),
          const Divider(),
          _buildDrawerItem(
            context,
            'Settings',
            Icons.settings,
            () {
              Navigator.pop(context);
            },
          ),
          _buildDrawerItem(
            context,
            'Help & Support',
            Icons.help,
            () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF1E293B),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1E293B),
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: const Color(0xFF3B82F6).withValues(alpha: 0.1),
    );
  }
}
