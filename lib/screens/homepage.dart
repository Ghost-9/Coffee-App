import 'package:coffee_app/widgets/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> _images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  final List<String> _coffeeNameList = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White',
    'Dark Mocha',
    'Detox Morning'
  ];

  final Map<String, String> _coffeePrice = {
    '4.20': 'With Oat Milk,',
    '3.14': 'With Chocolate ,',
    '5.20': 'With Whey Protein,',
    '2.20': 'With  Milk,'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          unselectedFontSize: 14,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          ]),
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.fastfood_outlined),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.supervised_user_circle_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.bebasNeue(
                  fontSize: 60,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIconColor: Colors.amber,
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: "Find Your Coffee...",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              margin: const EdgeInsets.symmetric(vertical: 30),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _coffeeNameList.length,
                  itemBuilder: (_, index) {
                    return Text(
                      '\t${_coffeeNameList[index]}\t\n ${index == 0 ? '*' : ''}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 22,
                          color: index == 0 ? Colors.orange : Colors.white),
                    );
                  }),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                  // cacheExtent: 4,
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (_, index) {
                    return CoffeeTile(
                      coffeePrice: _coffeePrice.keys.elementAt(index),
                      coffeeIngedrients: _coffeePrice.values.elementAt(index),
                      imagePath: _images[index],
                    );
                  }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25),
              child: Text(
                'Special For You',
                style: GoogleFonts.bebasNeue(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
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
                        child: const Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/5.jpg'),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: '5 Coffee Beans You\nMust Try !\n',
                        style: GoogleFonts.bebasNeue(
                          fontSize: 24,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'by Mayank Batra',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 14, fontWeight: FontWeight.w200)),
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
