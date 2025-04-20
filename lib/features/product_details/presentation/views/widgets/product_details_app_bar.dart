import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';

class ProductDetailsAppBar extends StatelessWidget implements PreferredSizeWidget{
  const ProductDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      iconTheme: const IconThemeData(color: AppColors.primary),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
