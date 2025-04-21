import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_images.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class SearchSliverBar extends StatelessWidget {
  const SearchSliverBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit,HomeState>(
      buildWhen: (previous, current) => current is ToggleSearchFieldState,
      builder: (context, state) => SliverAppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: controller.isSearchFieldOpened? 55.h :0,
        flexibleSpace: Visibility(
          visible: controller.isSearchFieldOpened,
          child: FlexibleSpaceBar(
            background: RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                style: AppFonts.fontSize16Medium,
                decoration: InputDecoration(
                  enabledBorder: buildOutlineInputBorder(),
                  focusedBorder: buildOutlineInputBorder(),
                  prefixIcon: const RPadding(
                    padding: EdgeInsets.all(8),
                    child: ImageIcon(AssetImage(AppImages.searchIcon),color: AppColors.primary,),
                  ),
                  hintText: "Search by product title",
                  hintStyle: AppFonts.fontSize16Medium.copyWith(color: AppColors.gray),
                ),
                onChanged: (value) => controller.productsSearch(productTitle: value.toLowerCase()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() =>  OutlineInputBorder(
    borderRadius:BorderRadius.circular(32.r),
      borderSide: const BorderSide(
          color: AppColors.gray,
      )
  );
}