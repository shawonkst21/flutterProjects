import 'package:flutter/material.dart';

class shop extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Brown Jacket',
      'price': '\$83.97',
      'image': 'assets/offer1.jpg',
      'rating': 4.9,
      'description': 'This is a fancy jacket.',
    },
    {
      'name': 'Brown Suit',
      'price': '\$120.00',
      'image': 'assets/offer2.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
    },
  ];

  final List<Map<String, dynamic>> _cart = [];
  final List<Map<String, dynamic>> _wishlist = [];

  // Getters for products, cart, and wishlist
  List<Map<String, dynamic>> get products => _products;
  List<Map<String, dynamic>> get cart => _cart;
  List<Map<String, dynamic>> get wishlist => _wishlist;

  // Add to Cart
  void addToCart(Map<String, dynamic> product, String size, Color color) {
    final cartItem = {
      ...product,
      'size': size,
      'color': color,
    };
    _cart.add(cartItem);
    notifyListeners();
  }

  // Remove from Cart
  void removeFromCart(Map<String, dynamic> item) {
    _cart.remove(item);
    notifyListeners();
  }

  // Add to Wishlist
  void addToWishlist(Map<String, dynamic> product) {
    if (!_wishlist.contains(product)) {
      _wishlist.add(product);
      notifyListeners();
    }
  }

  // Remove from Wishlist
  void removeFromWishlist(Map<String, dynamic> product) {
    _wishlist.remove(product);
    notifyListeners();
  }

  // Check if Product is in Wishlist
  bool isInWishlist(Map<String, dynamic> product) {
    return _wishlist.contains(product);
  }
}
