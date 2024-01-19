import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/common/models/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          centerTitle: true,
          title: Text(
            'Details',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12),
        child: Hero(
          tag: "id",
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(110),
                      image: DecorationImage(
                          image: NetworkImage(
                            widget.product.image,
                          ),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.product.title,
                    style: GoogleFonts.mooli(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('Sizes',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizeCard(
                        text: "XS",
                      ),
                      SizeCard(
                        text: "S",
                      ),
                      SizeCard(
                        text: "M",
                      ),
                      SizeCard(
                        text: "L",
                      ),
                      SizeCard(
                        text: "XL",
                      ),
                      SizeCard(
                        text: "XXL",
                      ),
                      SizeCard(
                        text: "XXXL",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.product.description,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('\$${widget.product.price}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        child: Text("Add to Cart",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent))
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

class SizeCard extends StatelessWidget {
  const SizeCard({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 14),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
          ),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
