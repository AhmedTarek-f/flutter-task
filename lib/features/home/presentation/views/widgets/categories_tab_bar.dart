import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/utlis/app_fonts.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class CategoriesTabBar extends StatelessWidget {
  const CategoriesTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return SliverAppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: BlocBuilder<HomeCubit,HomeState>(
          buildWhen: (previous, current) => current is FetchProductsSuccessState || current is ChangeSearchFieldValueState,
          builder: (context, state) => Visibility(
            visible: controller.searchProductsList.isEmpty,
            child: TabBar(
                splashFactory: NoSplash.splashFactory,
                splashBorderRadius: BorderRadius.circular(100.r),
                physics: const BouncingScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppColors.primary,
                indicatorPadding: REdgeInsets.symmetric(horizontal: 4,vertical: 4),
                isScrollable: true,
                indicatorWeight: 4,
                tabAlignment: TabAlignment.start,
                labelPadding: REdgeInsets.symmetric(horizontal: 16),
                unselectedLabelColor: AppColors.black,
                labelStyle: AppFonts.fontSize16SemiBold.copyWith(color: AppColors.primary),
                tabs: controller.categoriesList.map((category) => Tab(text: category,),).toList()
            ),
          ),
        ),
      ),
    );
  }
}