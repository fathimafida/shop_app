import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(140),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/sharara.jpg",
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              Text("This is an elagent sharara,with beautiful color and design",
                  style: GoogleFonts.mooli(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  )),
              SizedBox(
                height: 10,
              ),
              Text('Sizes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
              Text('mkmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('\$1200.00',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
