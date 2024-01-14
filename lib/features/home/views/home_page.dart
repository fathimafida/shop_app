import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  Widget build(BuildContext context) {
    final myItems = [
      CarousalImage(
        image: 'assets/images/classic.jpg',
      ),
      CarousalImage(
        image: 'assets/images/modern.jpg',
      ),
      CarousalImage(
        image: 'assets/images/modern2.jpg',
      ),
      CarousalImage(
        image: 'assets/images/western.jpg',
      ),
      CarousalImage(
        image: 'assets/images/stylish.jpg',
      ),
      CarousalImage(
        image: 'assets/images/shop6.jpg',
      ),
    ];

    return Scaffold(
      body: SafeArea(
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
                        Text('VogueVista,',
                            style: GoogleFonts.mooli(
                                color: Colors.purple,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text('Exclusively for women,',
                            style: GoogleFonts.mooli(
                                color: Colors.purple,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Icon(
                              Icons.search,
                              size: 25,
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 25,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CarouselSlider(
                            items: myItems,
                            options: CarouselOptions(
                              height: 150,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              autoPlay: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlayInterval: Duration(seconds: 3),
                              scrollDirection: Axis.horizontal,
                              enableInfiniteScroll: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  myCurrentIndex = index;
                                });
                              },
                            )),
                        Center(
                          child: DotsIndicator(
                            dotsCount: myItems.length,
                            position: myCurrentIndex,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("CATEGORIES",
                            style: GoogleFonts.mooli(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Tops",
                                    image: "assets/images/top.jpg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Jeans",
                                    image: "assets/images/jeans.jpg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Sarree",
                                    image: "assets/images/saree.jpg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Salwar",
                                    image: "assets/images/salwar.jpg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Kurti",
                                    image: "assets/images/kurti.jpg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Churidar",
                                    image: "assets/images/churidar.jpeg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Abaya",
                                    image: "assets/images/abaya.jpg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Lahenga",
                                    image: "assets/images/lahenga.jpg"),
                              ),
                              CategoryCard(
                                category: CategoryItem(
                                    title: "Sharara",
                                    image: "assets/images/sharara.jpg"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("TRENDING",
                            style: GoogleFonts.mooli(
                                color: Colors.purple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TrendCard(),
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
