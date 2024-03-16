import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/common/models/product.dart';
import 'package:shop_app/features/home/cubit/home_cubit.dart';

import 'package:shop_app/features/home/models/category.dart';
import 'package:shop_app/features/home/widgets/category_card.dart';
import 'package:shop_app/features/home/widgets/trending_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int myCurrentIndex = 0;
  bool _isLoading = false;
  final List<Product> productList = [];
  final List<CategoryItem> categoryList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final productResponse =
          await Dio().get("https://fakestoreapi.com/products/");

      for (final product in productResponse.data) {
        productList.add(Product.fromJson(product));
      }
      final categoryResponse =
          await Dio().get("https://api.escuelajs.co/api/v1/categories");

      for (final category in categoryResponse.data) {
        categoryList.add(CategoryItem.fromJson(category));
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final myItems = [
      const CarousalImage(
        image: 'assets/images/fashion8.jpg',
      ),
      const CarousalImage(
        image: 'assets/images/men3.jpg',
      ),
      const CarousalImage(
        image: 'assets/images/fashion9.jpg',
      ),
      const CarousalImage(
        image: 'assets/images/mens1.jpg',
      ),
      const CarousalImage(
        image: 'assets/images/stylish.jpg',
      ),
      const CarousalImage(
        image: 'assets/images/men2.jpeg',
      ),
    ];

    return SafeArea(
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                context.read<HomeCubit>().getHomedata();
              },
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(10),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('VogueVista,',
                                            style: GoogleFonts.mooli(
                                                color: Colors.deepOrange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        Text('Shop your choice!!',
                                            style: GoogleFonts.mooli(
                                                color: Colors.deepOrange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.search,
                                      size: 25,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 25,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CarouselSlider(
                                    items: myItems,
                                    options: CarouselOptions(
                                      height: 200,
                                      enlargeCenterPage: true,
                                      viewportFraction: 0.9,
                                      autoPlay: true,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      autoPlayInterval:
                                          const Duration(seconds: 3),
                                      scrollDirection: Axis.horizontal,
                                      enableInfiniteScroll: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          myCurrentIndex = index;
                                        });
                                      },
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: DotsIndicator(
                                    dotsCount: myItems.length,
                                    position: myCurrentIndex,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text("CATEGORIES",
                                    style: GoogleFonts.mooli(
                                        color: Colors.deepOrangeAccent,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (final category in categoryList)
                                        CategoryCard(
                                          category: category,
                                        )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text("TRENDING",
                                    style: GoogleFonts.mooli(
                                        color: Colors.deepOrange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    for (final product in productList)
                                      TrendCard(product: product)
                                  ],
                                )
                              ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CarousalImage extends StatelessWidget {
  const CarousalImage({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
