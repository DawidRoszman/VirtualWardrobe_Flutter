import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Wardrobe',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Virtual Wardrobe'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        scrollDirection: Axis.vertical,
        children: [
          buildCard('Green Shirt', 'https://www.rei.com/media/product/163975'),
          buildCard('White Shirt', 'https://static01.nyt.com/images/2013/09/22/magazine/22wmt/22wmt-superJumbo-v2.jpg'),
          buildCard('Jeans', 'https://lp2.hm.com/hmgoepprod?set=format%5Bwebp%5D%2Cquality%5B79%5D%2Csource%5B%2F7d%2F0c%2F7d0c8cd6e2c939e611dd20d4d05d0504bbc535ea.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url%5Bfile%3A%2Fproduct%2Fmain%5D'),
          buildCard('Sweater', 'https://pyxis.nymag.com/v1/imgs/11a/79a/cb41b9f38bbf3914b5923b123fe9a61b8f.2x.rsquare.w600.jpg'),
          buildCard('Jacket', 'https://cdn.shopify.com/s/files/1/0017/2100/8243/products/CWJ-1_CARBON_826e0095-4273-4eaf-9dd8-6cdf26d5b80a_2000x.jpg?v=1666642685'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(
          Icons.add_a_photo,
          size: 24,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,

            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
            label: "Search",
          ),
        ],
      ),
    );
  }

  Card buildCard(String text, String imgUrl) {
    return Card(
          elevation: 5,
          shadowColor: Colors.indigo,
          color: Colors.indigo,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              AspectRatio(
                aspectRatio: 5/5,
                  child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(imgUrl)),
                ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: <Color>[Colors.transparent, Colors.black]
                  )
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}
