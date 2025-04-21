import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/common_widgets/loading_indicator.dart';
import 'package:flutter_task/core/constants/app_images.dart';
import 'package:flutter_task/core/utlis/loaders/animation_loader.dart';
import 'package:flutter_task/core/utlis/loaders/loaders.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/search_grid_view.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class ProductsTabBarView extends StatelessWidget {
  const ProductsTabBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit,HomeState>(
      buildWhen: (previous, current) => current is FetchProductsSuccessState || current is FetchProductsFailureState || current is ChangeSearchFieldValueState ,
      listenWhen: (previous, current) => current is FetchProductsFailureState,
      listener: (context, state) {
        if(state is FetchProductsFailureState){
          Loaders.showErrorMessage(message: "Failed while loading products data: ${state.errorMessage}", context: context);
        }
      },
      builder: (context, state) => state is FetchProductsLoadingState?
        const LoadingIndicator():
        controller.allProductsList.isEmpty?
        const AnimationLoaderWidget(text: "There are no available products right now.", animation: AppImages.emptyAnimation):
        controller.searchProductsList.isNotEmpty?
        const SearchGridView():
        TabBarView(
          physics: const BouncingScrollPhysics(),
          children: controller.listOfCategoryProductsList.map((productsList) => ProductsGridView(productsList: productsList,)).toList(),
        )
    );
  }
}