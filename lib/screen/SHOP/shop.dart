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
    {
      'name': 'Brown Suit',
      'price': '\$120.00',
      'image': 'assets/offer2.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
    },
    {
      'name': 'Brown Suit',
      'price': '\$120.00',
      'image': 'assets/offer2.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
    },
    {
      'name': 'Brown Suit',
      'price': '\$120.00',
      'image': 'assets/offer2.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
    },
    {
      'name': 'Brown Suit',
      'price': '\$120.00',
      'image': 'assets/offer2.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
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
// Add to Cart with quantity handling
  void addToCart(Map<String, dynamic> product, String size, Color color) {
    final existingIndex = _cart.indexWhere((item) =>
        item['name'] == product['name'] &&
        item['size'] == size &&
        item['color'] == color);

    if (existingIndex >= 0) {
      _cart[existingIndex]['quantity'] += 1;
    } else {
      _cart.add({...product, 'size': size, 'color': color, 'quantity': 1});
    }
    notifyListeners();
  }

  // Increase Quantity
  void increaseQuantity(Map<String, dynamic> item) {
    final index = _cart.indexOf(item);
    if (index != -1) {
      _cart[index]['quantity'] += 1;
      notifyListeners();
    }
  }

  // Decrease Quantity
  void decreaseQuantity(Map<String, dynamic> item) {
    final index = _cart.indexOf(item);
    if (index != -1) {
      if (_cart[index]['quantity'] > 1) {
        _cart[index]['quantity'] -= 1;
      } else {
        _cart.removeAt(index); // Remove item if quantity reaches zero
      }
      notifyListeners();
    }
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
