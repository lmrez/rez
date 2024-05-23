import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Resturant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
    name: "Hamburger",
    description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
    imagePath: "lib/images/burgers/hamb.jpg",
    price: 19.99,
    category: FoodCategory.burgers,
    AvailableAddons: [
      Addon(name: "Extra cheese", price: 0.99),
      Addon(name: "Bacon", price: 0.99),
      Addon(name: "Extra tomato", price: 0.99),
    ],
  ),
  Food(
    name: "Fish Burger",
    description: "A crispy fish fillet with tartar sauce, lettuce, and tomato.",
    imagePath: "lib/images/burgers/fburger.jpg",
    price: 19.99,
    category: FoodCategory.burgers,
    AvailableAddons: [
      Addon(name: "Extra cheese", price: 0.99),
      Addon(name: "Bacon", price: 0.99),
      Addon(name: "Extra tomato", price: 0.99),
    ],
  ),
  Food(
    name: "Chicken Burger",
    description: "A grilled chicken breast with lettuce, tomato, and mayo.",
    imagePath: "lib/images/burgers/cburger.png",
    price: 19.99,
    category: FoodCategory.burgers,
    AvailableAddons: [
      Addon(name: "Extra cheese", price: 0.99),
      Addon(name: "Bacon", price: 0.99),
      Addon(name: "Extra tomato", price: 0.99),
    ],
  ),
  Food(
    name: "Cheese Burger",
    description: "A beef patty topped with melted cheddar, lettuce, and tomato.",
    imagePath: "lib/images/burgers/cheeseb.jfif",
    price: 19.99,
    category: FoodCategory.burgers,
    AvailableAddons: [
      Addon(name: "Extra cheese", price: 0.99),
      Addon(name: "Bacon", price: 0.99),
      Addon(name: "Extra tomato", price: 0.99),
    ],
  ),
  // salads
  Food(
    name: "Caesar Salad",
    description: "Fresh romaine lettuce, croutons, parmesan cheese, and Caesar dressing.",
    imagePath: "lib/images/salads/csalad.jpg",
    price: 19.99,
    category: FoodCategory.salads,
    AvailableAddons: [],
  ),
  Food(
    name: "Chef Salad",
    description: "Mixed greens topped with ham, turkey, cheese, and hard-boiled eggs.",
    imagePath: "lib/images/salads/chsalad.jpeg",
    price: 19.99,
    category: FoodCategory.salads,
    AvailableAddons: [],
  ),
  Food(
    name: "Greek Salad",
    description: "Tomatoes, cucumbers, olives, feta cheese, and red onions with olive oil.",
    imagePath: "lib/images/salads/gsalad.jpg",
    price: 19.99,
    category: FoodCategory.salads,
    AvailableAddons: [],
  ),
  Food(
    name: "Italian Salad",
    description: "Mixed greens with tomatoes, cucumbers, olives, and Italian dressing.",
    imagePath: "lib/images/salads/isalad.jpg",
    price: 19.99,
    category: FoodCategory.salads,
    AvailableAddons: [],
  ),
  // desserts
  Food(
    name: "Donut",
    description: "A classic glazed donut with a sweet, sugary coating.",
    imagePath: "lib/images/desserts/donut.webp",
    price: 19.99,
    category: FoodCategory.desserts,
    AvailableAddons: [],
  ),
  Food(
    name: "Flan Dessert",
    description: "A creamy caramel flan with a smooth texture and rich flavor.",
    imagePath: "lib/images/desserts/flan_dessert.webp",
    price: 19.99,
    category: FoodCategory.desserts,
    AvailableAddons: [],
  ),
  Food(
    name: "Helado",
    description: "A scoop of creamy, rich ice cream in your choice of flavor.",
    imagePath: "lib/images/desserts/helado.webp",
    price: 19.99,
    category: FoodCategory.desserts,
    AvailableAddons: [],
  ),
  Food(
    name: "Tarta",
    description: "A delicious tart with a flaky crust and sweet fruit filling.",
    imagePath: "lib/images/desserts/tdessert.jpg",
    price: 19.99,
    category: FoodCategory.desserts,
    AvailableAddons: [],
  ),
  // drinks
  Food(
    name: "Juice",
    description: "A refreshing glass of fruit juice.",
    imagePath: "lib/images/drinks/drink1.jpg",
    price: 19.99,
    category: FoodCategory.drinks,
    AvailableAddons: [
      Addon(name: "Extra Ice", price: 0.99),
    ],
  ),
  Food(
    name: "Wine",
    description: "A glass of fine wine.",
    imagePath: "lib/images/drinks/drink2.jpg",
    price: 19.99,
    category: FoodCategory.drinks,
    AvailableAddons: [
      Addon(name: "Extra Ice", price: 0.99),
    ],
  ),
  Food(
    name: "Apple Juice",
    description: "A refreshing glass of apple juice.",
    imagePath: "lib/images/drinks/drink3.jpg",
    price: 19.99,
    category: FoodCategory.drinks,
    AvailableAddons: [
      Addon(name: "Extra Ice", price: 0.99),
    ],
  ),
  Food(
    name: "Orange Juice",
    description: "A glass of freshly squeezed orange juice.",
    imagePath: "lib/images/drinks/drink4.jpg",
    price: 19.99,
    category: FoodCategory.drinks,
    AvailableAddons: [
      Addon(name: "Extra Ice", price: 0.99),
    ],
  ),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = "Auezov 99";

  // G E T T E R S
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // O P E R A T I O N S

  // add to cart
  void addToCart(Food food, List<Addon> SelectedAddons) {
    //see if there is a cart item already the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check food items are the same
      bool isSameFood = item.food == food;
      //check if the list of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.SelectedAddons, SelectedAddons);

      return isSameFood && isSameAddons;
    });
    //if item already exists increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise add new cart item
    else {
      _cart.add(CartItem(
        food: food,
        SelectedAddons: SelectedAddons,
      ));
    }
    notifyListeners();
  }
  //remove from cart

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart

  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.SelectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in the cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //H E L P E R S
  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format the date to include up to seconds only.
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln("");
    receipt.writeln("==================");

    for (final CartItem in _cart) {
      receipt.writeln(
          "${CartItem.quantity} x ${CartItem.food.name} - ${_formatPrice(CartItem.food.price)}");
      if (CartItem.SelectedAddons.isNotEmpty) {
        receipt
            .writeln("     Add-ons: ${_formatAddons(CartItem.SelectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("===============");
    receipt.writeln("");
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  //format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
