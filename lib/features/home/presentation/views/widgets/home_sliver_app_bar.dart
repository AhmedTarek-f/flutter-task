import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_images.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "MrPerfection Store",
          style: AppFonts.fontSize24Bold.copyWith(color: AppColors.primary),
        ),
        background: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RPadding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: (){
                    controller.toggleSearchField();
                  },
                  icon: ImageIcon(
                      const AssetImage(AppImages.searchIcon),
                    size: 28.r,
                    color: AppColors.primary,
                  )
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }
}