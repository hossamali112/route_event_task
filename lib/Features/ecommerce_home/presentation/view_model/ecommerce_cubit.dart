
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../data/product_model.dart';

part 'ecommerce_state.dart';

class EcommerceCubit extends Cubit<EcommerceState> {
  EcommerceCubit(super.initialState);

List<ProductModel> allProducts = [];
  final dio = Dio();


void getAllProducts ()async{
try{
  emit(ProductsLoading());
  final response = await dio.get('https://dummyjson.com/products');
  List<dynamic> data = response.data['products'];
  allProducts.clear();
  for(int i = 0; i< data.length; i++){
    allProducts.add(ProductModel.fromJson(data[i]));
  }
emit(ProductsSuccess());
  print(allProducts.length);
}
catch(e){
  print(e);
  emit(ProductsFailiure());
}





}

void addOrRemoveFaveoriteProduct(ProductModel changedProduct){

  allProducts[allProducts.indexOf(changedProduct)].productSelected = ! allProducts[allProducts.indexOf(changedProduct)].productSelected;
emit(ProductsUpdate());
}




}
