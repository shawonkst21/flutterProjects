import 'package:flutter/material.dart';
import 'package:hi/screen/SHOP/shop.dart';
import 'package:hi/screen/productDetails.dart';
import 'package:provider/provider.dart';

class wishlistPage extends StatefulWidget {
  const wishlistPage({super.key});

  @override
  wishlistPageState createState() => wishlistPageState();
}

class wishlistPageState extends State<wishlistPage> {
  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<shop>(context);
    final wishitem = shopProvider.wishlist;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0), // Added padding here
        child: wishitem.isEmpty
            ? const Center(
                child: Text(
                  'Your wishlist is empty!',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8, // Added more spacing
                  mainAxisSpacing: 8, // Added more spacing
                ),
                itemCount: wishitem.length,
                itemBuilder: (context, index) {
                  final product = wishitem[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                product['image'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  product['price'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          product['rating'].toString(),
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        shopProvider.isInWishlist(product)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            shopProvider.isInWishlist(product)
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (shopProvider
                                              .isInWishlist(product)) {
                                            shopProvider
                                                .removeFromWishlist(product);
                                          } else {
                                            shopProvider.addToWishlist(product);
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
