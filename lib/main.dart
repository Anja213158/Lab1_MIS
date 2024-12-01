import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '213158',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product('Јакна', 'assets/jacket.jpg', 'Одлична зимска јакна.', 1200),
    Product('Маица', 'assets/tshirt.jpg', 'Удобна памучна маица.', 400),
    Product('Панталони', 'assets/pants.jpg', 'Совршени панталони за секој ден.', 800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('213158'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index]),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    products[index].image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(products[index].name),
                  Text('\$${products[index].price}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String description;
  final double price;

  Product(this.name, this.image, this.description, this.price);
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: 400,
              width: 400,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 40),
            Text(product.name, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Text('Цена: \$${product.price}', style: TextStyle(fontSize: 30)),
            SizedBox(height: 30),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
