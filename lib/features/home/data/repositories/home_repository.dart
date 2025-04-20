import 'package:flutter_task/features/home/data/data_sources/remote_data_source/home_remote_data.dart';
import 'package:flutter_task/features/home/data/models/product_model/product_model.dart';

abstract class HomeRepository{
  static Future<List<ProductModel>> fetchProducts() async {
    try{
      return await HomeRemoteData.fetchProducts();
    }
    catch(e){
      throw e.toString();
    }
  }
}