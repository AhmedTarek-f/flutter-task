import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/categories_tab_bar.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/home_sliver_app_bar.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/products_tab_bar_view.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/search_sliver_bar.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit,HomeState>(
      buildWhen: (previous, current) => current is FetchProductsSuccessState,
      builder: (context, state) => DefaultTabController(
        length: controller.categoriesList.length,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const HomeSliverAppBar(),
              const SearchSliverBar(),
              const CategoriesTabBar()
            ],
            body: const ProductsTabBarView()
        ),
      ),
    );
  }
}