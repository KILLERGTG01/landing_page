import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wishlist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WishlistPage(),
    );
  }
}

class WishlistPage extends StatelessWidget {
  WishlistPage({super.key});
  final List<WishlistItem> items = [
    WishlistItem(
        imagePath: 'assets/images/image1.png',
        name: 'Roller Rabbit',
        description: 'Vado Odelle Dress',
        price: 198.00),
    WishlistItem(
        imagePath: 'assets/images/image2.png',
        name: 'Axel Arigato',
        description: 'Clean 90 Tirole Sneakers',
        price: 245.00),
    WishlistItem(
        imagePath: 'assets/images/image3.png',
        name: 'Herschel Supply Co.',
        description: 'Daypack Backpack',
        price: 40.00),
    WishlistItem(
        imagePath: 'assets/images/image4.png',
        name: 'Soludos',
        description: 'Ibiza Classic Lace Sneakers',
        price: 120.00),
    WishlistItem(
        imagePath: 'assets/images/image5.png',
        name: 'On Ear Headphone',
        description: 'Beats Solo3 Wireless Kulak',
        price: 50.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.more_vert),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Wishlist',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            item.imagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(item.description),
                              const SizedBox(height: 8.0),
                              Text(
                                '\$${item.price.toStringAsFixed(2)}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                textStyle: const TextStyle(color: Colors.white),
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                minimumSize: const Size(100, 36),
                              ),
                              child: const Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistItem {
  final String imagePath;
  final String name;
  final String description;
  final double price;

  WishlistItem({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });
}
