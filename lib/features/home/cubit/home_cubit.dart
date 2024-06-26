import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/home/models/category.dart';
import 'package:shop_app/features/home/models/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomedata() async {
    emit(HomeLoading());
    try {
      final productResponse =
          await Dio().get("http://127.0.0.1:8000/api/products");
      final List<Product> productList = [];
      for (final product in productResponse.data) {
        productList.add(Product.fromJson(product));
      }
      final categoryResponse =
          await Dio().get("https://api.escuelajs.co/api/v1/categories");
      final List<CategoryItem> categoryList = [];
      for (final category in categoryResponse.data) {
        categoryList.add(CategoryItem.fromJson(category));
      }
      emit(HomeLoaded(categoryList, productList));
    } on DioException catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
