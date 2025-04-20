import 'package:flutter_task/core/utlis/exceptions/dio_exceptions.dart';
import 'package:flutter_task/core/utlis/services/api_services.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';

abstract class HomeRemoteData{
  
  static Future<List<ProductModel>> fetchProducts() async {
    try{
     final response = await ApiService.getRequest("/products");
     if(response?.statusCode == 200){
       if(response?.data != null){
         final productsData = response!.data as List;
         final List<ProductModel> allProducts = productsData.map((product) => ProductModel.fromJson(product)).toList();
         return allProducts;
       }
       else{
         return [];
       }
     }
     else{
       return [];
     }
    }
    catch(e){
      String errorMessage = DioExceptions.handleError(e);
      throw errorMessage;
    }
  }
  
}