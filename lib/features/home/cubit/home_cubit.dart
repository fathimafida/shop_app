import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/common/models/product.dart';
import 'package:shop_app/features/home/models/category.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomedata() async {
    emit(HomeLoading());
    try {
      final productResponse =
          await Dio().get("https://fakestoreapi.com/products/");
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
    } catch (e) {
      print(e);
      emit(HomeError(e.toString()));
    }
  }
}
