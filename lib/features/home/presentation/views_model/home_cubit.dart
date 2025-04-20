import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';
import 'package:flutter_task/features/home/data/repositories/home_repository.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()){
    onInit();
  }

  List<ProductModel> productsList = [];
  void onInit(){
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try{
      emit(FetchProductsLoadingState());
      productsList = await HomeRepository.fetchProducts();
      emit(FetchProductsSuccessState());
    }
    catch(e){
      emit(FetchProductsFailureState(errorMessage: e.toString()));
    }
  }

}
