import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';
import 'package:flutter_task/features/home/data/repositories/home_repository.dart';
import 'package:flutter_task/features/home/presentation/views_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()){
    onInit();
  }

  List<ProductModel> allProductsList = [];
  List<ProductModel> searchProductsList = [];
  List<List<ProductModel>> listOfCategoryProductsList = [];
  List<String> categoriesList = [];
  bool isSearchFieldOpened = false;
  void onInit(){
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    try{
      emit(FetchProductsLoadingState());
      allProductsList = await HomeRepository.fetchProducts();
      getCategoriesList();
      getCategoryProductsList();
      emit(FetchProductsSuccessState());
    }
    catch(e){
      emit(FetchProductsFailureState(errorMessage: e.toString()));
    }
  }

  void productsSearch({required String productTitle}){
    searchProductsList.clear();
    if((productTitle.isNotEmpty) && productTitle.trim() != "" ){
      final List<ProductModel> matchedList = allProductsList.where((product) => product.title.toLowerCase().contains(productTitle)).toList();
      searchProductsList.addAll(matchedList);
    }
    emit(ChangeSearchFieldValueState());
  }

  void toggleSearchField(){
    isSearchFieldOpened = !isSearchFieldOpened;
    searchProductsList.clear();
    emit(ToggleSearchFieldState());
    emit(ChangeSearchFieldValueState());
  }

  void getCategoriesList(){
    categoriesList = allProductsList.map((product) => product.category).toList();
    categoriesList = categoriesList.toSet().toList();
    categoriesList.insert(0, "All");
  }

  void getCategoryProductsList(){
    listOfCategoryProductsList.add(allProductsList);
   for(int i =1; i<categoriesList.length; i++){
     final categoryProductsList = allProductsList.where((product)=> product.category == categoriesList[i]).toList();
     listOfCategoryProductsList.add(categoryProductsList);
   }
  }
}
