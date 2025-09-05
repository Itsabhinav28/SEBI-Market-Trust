import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';

class ProfessionalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onNotificationPressed;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool showNotificationButton;
  final Widget? customLeading;
  final bool? centerTitle;

  const ProfessionalAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onNotificationPressed,
    this.actions,
    this.showBackButton = true,
    this.showNotificationButton = true,
    this.customLeading,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.backgroundPrimary,
      leading: customLeading ??
          (showBackButton
              ? Container(
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
                    icon: const Icon(Icons.arrow_back_ios_new,
                        color: AppColors.primaryDark),
                    onPressed: onBackPressed ?? () => context.pop(),
                  ),
                )
              : null),
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryDark,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      centerTitle: centerTitle ?? true,
      actions: [
        if (showNotificationButton)
          Container(
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
              icon: const Icon(Icons.notifications_outlined,
                  color: AppColors.primaryDark),
              onPressed: onNotificationPressed ?? () {},
            ),
          ),
        if (actions != null) ...actions!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
