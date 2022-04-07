import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTile extends StatelessWidget {
  final String imagePath;

  final String coffeePrice;
  final String coffeeIngedrients;
  const CoffeeTile(
      {Key? key,
      required this.imagePath,
      required this.coffeeIngedrients,
      required this.coffeePrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      height: 280,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            height: 150,
            width: 160,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                filterQuality: FilterQuality.none,
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: RichText(
              text: TextSpan(
                text: 'Cappuccino\n',
                style: GoogleFonts.bebasNeue(
                  fontSize: 24,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: coffeeIngedrients,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 12, fontWeight: FontWeight.w200)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: '\$',
                    style: GoogleFonts.bebasNeue(
                        fontSize: 26, color: Colors.orange),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' $coffeePrice',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.orange),
                    child: const Center(child: Icon(Icons.add))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
