import 'package:flutter/material.dart';

class shop extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Brown Jacket',
      'price': '\$83.97',
      'image': 'assets/p2.jpg',
      'rating': 4.9,
      'description': 'A classic brown jacket made from premium leather with a sleek and modern design. It features a zip-up front, two side pockets, and a soft inner lining for added comfort. The rich brown color makes it versatile, perfect for pairing with casual jeans or a more formal outfit. Ideal for both chilly autumn evenings and trendy everyday wear.',
    },
    {
      'name': 'Skin Care',
      'price': '\$120.00',
      'image': 'assets/p1.avif',
      'rating': 5.0,
      'description':
          'A classic for a very good reason, this budget-friendly cleanser is a popular drugstore find for all of its acne-fighting perks. As you’re using it to deeply clean pores, the oil-free formula consists of salicylic acid to treat current breakouts and prevent future ones.',
    },
    {
      'name': 'Winter Combo',
      'price': '\$150.00',
      'image': 'assets/p3.jpg',
      'rating': 5.0,
      'description':
          'Winter is coming, as they say. And if you are already feeling a chill in the air, then dust off the pullovers and comforters. This is the time to settle down under woolen blankets and curl your feet under the nearest source of heat.',
    },
    {
      'name': 'Zeira Shoe ',
      'price': '\$100.00',
      'image': 'assets/offer2.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
    },
    {
      'name': 'Winter running shoe',
      'price': '\$80.00',
      'image': 'assets/p4.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
    },
    {
      'name': 'Wellington boots for women ',
      'price': '\$120.00',
      'image': 'assets/p5.jpg',
      'rating': 5.0,
      'description': 'This is a fancy suit.',
    },
    {
      'name': 'Bubble bath',
      'price': '\$120.00',
      'image': 'assets/p6.jpg',
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