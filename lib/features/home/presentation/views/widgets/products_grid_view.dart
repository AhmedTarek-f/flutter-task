import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/common_widgets/loading_indicator.dart';
import 'package:flutter_task/core/constants/app_images.dart';
import 'package:flutter_task/core/utlis/loaders/animation_loader.dart';
import 'package:flutter_task/core/utlis/loaders/loaders.dart';
import 'package:flutter_task/features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_cubit.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit,HomeState>(
      buildWhen: (previous, current) => current is FetchProductsSuccessState || current is FetchProductsFailureState,
      listenWhen: (previous, current) => current is FetchProductsFailureState,
      listener: (context, state) {
        if(state is FetchProductsFailureState){
          Loaders.showErrorMessage(message: "Failed while loading products data: ${state.errorMessage}", context: context);
        }
      },
      builder: (context, state) => state is FetchProductsLoadingState?
        const LoadingIndicator():
        controller.productsList.isEmpty?
        const AnimationLoaderWidget(text: "There are no available products right now.", animation: AppImages.emptyAnimation):
        GridView.builder(
        physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 8,
            childAspectRatio: 1/1.05
          ),
        itemBuilder: (context, index) => ProductItem(productData: controller.productsList[index],),
        itemCount: controller.productsList.length,
      ),
    );
  }
}